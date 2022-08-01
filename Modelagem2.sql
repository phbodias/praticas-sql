CREATE TYPE "productCategory" AS ENUM (
    'Camisa',
    'Calça',
    'Vestido',
    'Tênis',
    'Acessorio'
);

CREATE TYPE "productSyze" AS ENUM ('PP', 'P', 'M', 'G', 'GG');

CREATE TYPE "purchaseStatus" AS ENUM ('deposit', 'withdraw');

CREATE TABLE "public.customerAddress" (
	"cep" integer NOT NULL,
	"number" integer NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "customerAddress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"email" VARCHAR(255) NOT NULL UNIQUE,
	"password" VARCHAR(255) NOT NULL,
	"address" integer NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"imagesId" integer NOT NULL,
	syze "productSyze" NOT NULL,
    category "productCategory" NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productImages" (
	"id" serial NOT NULL,
	"img_principal" VARCHAR(255) NOT NULL UNIQUE,
	"imgs" VARCHAR(255) NOT NULL UNIQUE,
	CONSTRAINT "productImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"customerId" serial NOT NULL,
	"productId" serial NOT NULL,
	status "purchaseStatus" NOT NULL,
	"amount" integer NOT NULL,
	"date" DATE NOT NULL,
	"deliveryId" VARCHAR(255) NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("address") REFERENCES "customerAddress"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("imagesId") REFERENCES "productImages"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("deliveryId") REFERENCES "customerAddress"("id");







