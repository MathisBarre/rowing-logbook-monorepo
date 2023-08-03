-- CreateTable
CREATE TABLE "Rower" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Session" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "distance" REAL,
    "estimatedStartDateTime" DATETIME,
    "estimatedEndDateTime" DATETIME,
    "startDateTime" DATETIME,
    "endDateTime" DATETIME,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "routeId" INTEGER,
    CONSTRAINT "Session_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES "Route" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "RowersOnSessions" (
    "rowerId" INTEGER NOT NULL,
    "sessionId" INTEGER NOT NULL,

    PRIMARY KEY ("rowerId", "sessionId"),
    CONSTRAINT "RowersOnSessions_rowerId_fkey" FOREIGN KEY ("rowerId") REFERENCES "Rower" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RowersOnSessions_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Boat" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "BoatsOnSessions" (
    "boatId" INTEGER NOT NULL,
    "sessionId" INTEGER NOT NULL,

    PRIMARY KEY ("boatId", "sessionId"),
    CONSTRAINT "BoatsOnSessions_boatId_fkey" FOREIGN KEY ("boatId") REFERENCES "Boat" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "BoatsOnSessions_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Route" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "distance" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
