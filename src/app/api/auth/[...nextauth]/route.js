// * NextAuth imports
import NextAuth from 'next-auth';
import GoogleProvider from 'next-auth/providers/google';
import { PrismaAdapter } from "@next-auth/prisma-adapter"
const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient();

export const handler = NextAuth({
    // * Providers configuration
    providers: [
        GoogleProvider({
            clientId: process.env.GOOGLE_ID,
            clientSecret: process.env.GOOGLE_SECRET,
        })
    ],
    adapter: PrismaAdapter(prisma),
});
export { handler as GET, handler as POST };