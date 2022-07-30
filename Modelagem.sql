CREATE TABLE customers (
    id serial NOT NULL PRIMARY KEY,
    "fullName" text NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    email text NOT NULL UNIQUE,
    password text NOT NULL
);

CREATE TABLE states (
    id serial NOT NULL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE cities (
    id serial NOT NULL PRIMARY KEY,
    name text NOT NULL,
    "stateId" integer NOT NULL REFERENCES states(id)
);

CREATE TABLE "customerAddresses" (
    id serial NOT NULL PRIMARY KEY,
    "customerId" integer NOT NULL UNIQUE REFERENCES customers(id),
    street text NOT NULL,
    number integer NOT NULL,
    complement text NOT NULL,
    "postalCode" text NOT NULL,
    "cityId" integer NOT NULL REFERENCES cities(id)
);

CREATE TABLE "bankAccount" (
    id serial NOT NULL PRIMARY KEY,
    "customerId" integer NOT NULL REFERENCES customers(id),
    "accountNumber" integer NOT NULL UNIQUE,
    agency text NOT NULL,
    "openDate" timestamp NOT NULL DEFAULT NOW(),
    "closeDate" timestamp
);

CREATE TABLE transactions (
    id serial NOT NULL PRIMARY KEY,
    "bankAccountId" integer NOT NULL REFERENCES "bankAccount"(id),
    amount integer NOT NULL,
    type text NOT NULL,
    time timestamp NOT NULL DEFAULT NOW(),
    description varchar(50),
    cancelled boolean DEFAULT false
);

CREATE TABLE "creditCards" (
    id serial NOT NULL PRIMARY KEY,
    "bankAccountId" integer NOT NULL REFERENCES "bankAccount"(id),
    name text NOT NULL,
    number integer NOT NULL UNIQUE,
    "securityCode" integer NOT NULL UNIQUE,
    "expirationMonth" text NOT NULL,
    "expirationYear" text NOT NULL,
    password text NOT NULL,
    "limitCard" integer NOT NULL
)