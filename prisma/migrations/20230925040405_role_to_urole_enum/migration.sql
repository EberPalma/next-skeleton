/*
  Warnings:

  - You are about to drop the column `userRole` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "URole" AS ENUM ('user', 'admin');

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_userRole_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "userRole",
ADD COLUMN     "role" "URole" NOT NULL DEFAULT 'user';

-- DropTable
DROP TABLE "Role";
