import { NextApiResponse } from "next"

export const INTERNAL_SERVER_ERROR = (res: NextApiResponse, error: any) => {
  console.error(error)
  return res
    .status(500)
    .json({ error: error.message ?? "Internal server error" })
}
export const INVALID_REQUEST = (res: NextApiResponse) => {
  return res.status(404).json({ message: "Invalid request" })
}
