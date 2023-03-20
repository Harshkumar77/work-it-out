import { NextApiResponse } from "next"
import { ZodError } from "zod"

export const INTERNAL_SERVER_ERROR = (res: NextApiResponse, error: any) => {
  console.error(error)
  return res
    .status(500)
    .json({ error: error.message ?? "Internal server error" })
}
export const INVALID_REQUEST = (res: NextApiResponse) => {
  return res.status(404).json({ message: "Invalid request" })
}

export const ZOD_VALIDATION_ERROR = (res : NextApiResponse , error : ZodError<any>)=>{
      return res.status(400).json({ error: error.issues })
}
