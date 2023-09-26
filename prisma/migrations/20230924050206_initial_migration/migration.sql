-- CreateTable

CREATE TABLE
    "Account" (
        "id" TEXT NOT NULL,
        "userId" TEXT NOT NULL,
        "type" TEXT NOT NULL,
        "provider" TEXT NOT NULL,
        "providerAccountId" TEXT NOT NULL,
        "refreshToken" TEXT,
        "access_token" TEXT,
        "expires_at" INT,
        "scope" TEXT,
        "token_type" TEXT,
        "id_token" TEXT,
        "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP(3) NOT NULL,

CONSTRAINT "Account_pkey" PRIMARY KEY ("id") );

-- CreateTable

CREATE TABLE
    "Session" (
        "id" TEXT NOT NULL,
        "userId" TEXT NOT NULL,
        "expires" TIMESTAMP(3) NOT NULL,
        "sessionToken" TEXT NOT NULL,
        "accessToken" TEXT,
        "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP(3),

CONSTRAINT "Session_pkey" PRIMARY KEY ("id") );

-- CreateTable

CREATE TABLE
    "User" (
        "id" TEXT NOT NULL,
        "name" TEXT,
        "email" TEXT,
        "emailVerified" TIMESTAMP(3),
        "image" TEXT,
        "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP(3) NOT NULL,

CONSTRAINT "User_pkey" PRIMARY KEY ("id") );

-- CreateTable

CREATE TABLE
    "VerificationRequest" (
        "id" TEXT NOT NULL,
        "identifier" TEXT NOT NULL,
        "token" TEXT NOT NULL,
        "expires" TIMESTAMP(3) NOT NULL,
        "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updatedAt" TIMESTAMP(3) NOT NULL,

CONSTRAINT "VerificationRequest_pkey" PRIMARY KEY ("id") );

-- CreateTable

CREATE TABLE
    "Page" (
        "id" SERIAL NOT NULL,
        "uq" VARCHAR(255) NOT NULL,
        "category" VARCHAR(255) NOT NULL,
        "title" VARCHAR(255) NOT NULL,
        "clean_url" VARCHAR(255) NOT NULL,
        "subtitle" VARCHAR(255),
        "subtitle_allowed" BOOLEAN,
        "images_json" JSONB,
        "images_allowed" BOOLEAN,
        "main_content" TEXT,
        "main_content_allowed" BOOLEAN,
        "products" JSONB,
        "products_allowed" BOOLEAN,
        "button_label" VARCHAR(255),
        "button_allowed" BOOLEAN,
        "icon" VARCHAR(255),
        "icon_allowed" BOOLEAN,
        "link" VARCHAR(255),
        "link_allowed" BOOLEAN,
        "active" BOOLEAN NOT NULL DEFAULT true,
        "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
        "updated_at" TIMESTAMP(3) NOT NULL,

CONSTRAINT "Page_pkey" PRIMARY KEY ("id") );

-- CreateIndex

CREATE UNIQUE INDEX "Account_providerId_providerAccountId_key" ON "Account"(
    "provider",
    "providerAccountId"
);

-- CreateIndex

CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex

CREATE UNIQUE INDEX "Session_accessToken_key" ON "Session"("accessToken");

-- CreateIndex

CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex

CREATE UNIQUE INDEX "VerificationRequest_token_key" ON "VerificationRequest"("token");

-- CreateIndex

CREATE UNIQUE INDEX "VerificationRequest_identifier_token_key" ON "VerificationRequest"("identifier", "token");

-- CreateIndex

CREATE UNIQUE INDEX "Page_uq_key" ON "Page"("uq");

-- CreateIndex

CREATE UNIQUE INDEX "Page_clean_url_key" ON "Page"("clean_url");

-- AddForeignKey

ALTER TABLE "Account"
ADD
    CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey

ALTER TABLE "Session"
ADD
    CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;