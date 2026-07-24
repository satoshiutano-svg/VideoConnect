# VideoConnect

A real-time video chat application with a **video-first** design philosophy — camera feeds occupy 80%+ of the screen, minimizing UI distractions.

## Features

- 🎥 **Video-first layout** — Remote video dominates the viewport, local preview as a small overlay
- 🔗 **Real-time connections** — WebRTC via Socket.IO for peer matching and signaling
- 🎨 **Dark mode UI** — Material Design-inspired with Tailwind CSS and Radix UI components
- 📱 **Responsive** — Adapts from stacked mobile layouts to side-by-side desktop feeds
- ♿ **Accessible** — WCAG AA contrast, keyboard navigation, 44px+ touch targets

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React, Vite, Tailwind CSS, Radix UI, Framer Motion |
| Backend | Express.js, Socket.IO, Drizzle ORM |
| Database | Neon (PostgreSQL) |
| Auth | Passport.js |
| Real-time | WebSocket (ws), Socket.IO |

## Quick Start

```bash
npm install
npm run dev
```

## Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server |
| `npm run build` | Build for production |
| `npm start` | Run production build |
| `npm run check` | TypeScript type checking |
| `npm run db:push` | Push schema to database |
