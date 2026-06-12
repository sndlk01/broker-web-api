# Broker Web API

---

## Requirements

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/)

---

## Quick Start

### 1. Clone the repository

```bash
git clone <repo-url>
cd broker-web-api
```

### 2. Create `.env` file

```bash
cp .env.example .env
```

แก้ค่าใน `.env`

```env
PORT=3030
NODE_ENV=production

POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password
POSTGRES_DB=broker

DATABASE_URL=postgresql://postgres:your_password@db:5432/broker

JWT_SECRET=your_jwt_secret
```

### 3. Pull image จาก Docker Hub และรัน

```bash
docker compose pull
docker compose up -d
```

หรือ build เองจาก source:

```bash
docker compose up --build -d
```

API จะรันที่ `http://localhost:3030`

---

## Database

### Export (backup)

```bash
docker exec broker-db pg_dump -U postgres broker > backup.sql
```

### Import (restore)

```bash
docker compose up -d db

# restore
docker exec -i broker-db psql -U postgres broker < backup.sql
```

---

## API Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| GET | `/api/web/health` | — | Health check |
| POST | `/api/web/auth/register` | — | Register |
| POST | `/api/web/auth/login` | — | Login |
| GET | `/api/web/brokers` | — | List brokers |
| GET | `/api/web/brokers?search=&type=` | — | Search brokers |
| GET | `/api/web/brokers/:slug` | — | Get broker by slug |
| POST | `/api/web/brokers` | Bearer | Create broker |
| PUT | `/api/web/brokers/:id` | Bearer | Update broker |
| DELETE | `/api/web/brokers/:id` | Bearer | Delete broker |

`broker_type` รับค่า: `cfd`, `bond`, `stock`, `crypto`

---

## Postman

Import ไฟล์ `Broker Web API.postman_collection.json` เข้า Postman

**วิธี import:**
1. เปิด Postman → กด **Import**
2. ลากไฟล์ `Broker Web API.postman_collection.json` เข้ามา หรือ Browse เลือกไฟล์
3. กด **Import**

**Features:**
- ตั้งค่า `baseUrl` ไว้ที่ `http://localhost:3030/api/web` แก้ได้ใน Collection Variables
- Login สำเร็จแล้ว `{{token}}` จะถูก set อัตโนมัติ — ไม่ต้อง copy token เอง
- Request ที่ต้องการ Auth ใช้ `{{token}}` ใน Authorization header อัตโนมัติ

---

## Useful Commands

```bash
# ดู logs
docker compose logs -f api

# หยุด
docker compose down

# หยุดและลบ database volume
docker compose down -v
```
