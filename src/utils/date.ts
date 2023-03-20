import { GetWeightRequest } from "@/pages/api/weight"

export const zeroDate = (date: Date) =>
  new Date(date.toISOString().split("T")[0])

export const dateFrom = ({ duration, time }: GetWeightRequest) => {
  switch (duration) {
    case "today":
      return time
    case "week":
      time.setDate(time.getDate() - time.getDay() + 1)
      return time
    case "month":
      time.setDate(1)
      return time
    case "year":
      time.setMonth(0)
      return time
  }
  return new Date("1999-12-12")
}
