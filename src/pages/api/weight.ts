import type { NextApiRequest, NextApiResponse, NextApiHandler } from "next"
import { ZodError, z } from "zod"
import getUserFromSession from "@/utils/getUserFromSession"
import { dateFrom, zeroDate } from "@/utils/date"
import { type } from "os"
import {
  INTERNAL_SERVER_ERROR,
  INVALID_REQUEST,
  ZOD_VALIDATION_ERROR,
} from "@/utils/response"
import prisma from "@/lib/prisma"

const setWeightParser = z.object({
  time: z.coerce.date().transform(zeroDate),
  weight: z.number().gt(0),
})

const getWeightParser = z.object({
  duration: z
    .enum(["today", "week", "month", "year", "all"])
    .optional()
    .default("today"),
  time: z.coerce.date().transform(zeroDate),
})

export type GetWeightRequest = z.infer<typeof getWeightParser>

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse
) {
  try {
    const user = await getUserFromSession(req, res)
    if (!user) {
      return res.status(500).json({
        message: "WTF",
      })
    }
    if (req.method === "POST") {
      const body = setWeightParser.parse(req.body)
      const existingRecord = await prisma.weightOfDay.findFirst({
        where: {
          date: body.time,
          weightDataId: user.WeightData?.id,
        },
      })
      if (!existingRecord) {
        await prisma.weightOfDay.create({
          data: {
            date: body.time,
            Weight: body.weight,
            WeightData: {
              connect: {
                id: user.WeightData?.id,
              },
            },
          },
        })
        return res.status(201).json({ message: "Weight of the day added" })
      }
      await prisma.weightOfDay.update({
        where: {
          id: existingRecord.id,
        },
        data: {
          Weight: body.weight,
        },
      })
      return res.status(202).json({ message: "Weight Updated" })
    } else if (req.method === "GET") {
      const body = getWeightParser.parse(req.body)

      const data = await prisma.weightData.findMany({
        where: {
          userId: user.id,
        },
        include: {
          WeightOfDay: {
            where: {
              date: {
                gte: dateFrom(body),
              },
            },
            orderBy: {
              date: "asc",
            },
            select: {
              Weight: true,
              date: true,
            },
          },
        },
      })
      if (data.length === 0)
        return res
          .status(500)
          .json({ message: "No weight data is initialized for this user" })
      return res.status(200).json(data[0].WeightOfDay)
    } else return INVALID_REQUEST(res)
  } catch (error) {
    if (error instanceof ZodError) return ZOD_VALIDATION_ERROR(res, error)
    return INTERNAL_SERVER_ERROR(res, error)
  }
}
