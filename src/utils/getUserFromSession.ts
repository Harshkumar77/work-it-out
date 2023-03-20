import { authOptions } from "@/pages/api/auth/[...nextauth]"
import { getServerSession } from "next-auth/next"
import { NextApiRequest, NextApiResponse } from "next"
import prisma from "@/lib/prisma"

const getUserFromSession = async (
  req: NextApiRequest,
  res: NextApiResponse
) => {
  const session = await getServerSession(req, res, authOptions)
  if (!session) return res.status(401).json({ message: "Unauthorized access" })
  if (!session.user?.email) {
    return res.status(500).json({ message: "How we even reach here" })
  }
  return prisma.user.findUnique({
    where: {
      email: session.user.email,
    },
    include: {
      WeightData: true,
    },
  })
}

export default getUserFromSession
