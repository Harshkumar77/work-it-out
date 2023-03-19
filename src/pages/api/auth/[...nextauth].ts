import NextAuth from "next-auth"
import GoogleProvider from "next-auth/providers/google"
import { Profile } from "next-auth"
import prisma from "../../../../lib/prisma"

export default NextAuth({
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_ID ?? "",
      clientSecret: process.env.GOOGLE_SECRET ?? "",
    }),
  ],
  callbacks: {
    async signIn({ account, profile }) {
      if (!account || !profile) return false
      if (account.provider === "google") {
        const { email, picture, name } = profile as {
          name: string
          email: string
          picture: string
        }
        const user = await prisma.user.upsert({
          where: {
            email,
          },
          update: {
            picture: picture.split("=")[0],
          },
          create: {
            name,
            email,
            picture: picture.split("=")[0],
            ActivityData: {
              create: {},
            },
            NutritionData: {
              create: {},
            },
            WeightData: {
              create: {},
            },
          },
        })
        return true
      }
      return false
    },
  },
})
