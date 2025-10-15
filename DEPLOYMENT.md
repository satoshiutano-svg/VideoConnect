# Random Video Chat - Deployment Guide

## Overview
A real-time random video chat application built with React, Socket.io, and WebRTC for peer-to-peer video connections.

## Architecture
- **Frontend**: React + Tailwind CSS + Socket.io Client
- **Backend**: Node.js + Express + Socket.io (WebRTC Signaling Server)
- **Video**: WebRTC Peer-to-Peer Connections
- **Signaling**: Socket.io for WebRTC offer/answer/ICE candidate exchange

---

## Local Development

### Prerequisites
- Node.js 18+ installed
- Camera and microphone access

### Running Locally

1. **Install Dependencies**
```bash
npm install
```

2. **Start Development Server**
```bash
npm run dev
```

3. **Access the Application**
- Open `http://localhost:5000` in your browser
- Open another browser window/tab (or incognito) to test with two users
- Click "Find Partner" in both windows to connect

### Testing Locally
1. Open two browser windows/tabs
2. In each window, click "Find Partner"
3. Grant camera/microphone permissions
4. The users will automatically be paired
5. Test video chat, mute, camera toggle, and leave functionality

---

## Production Deployment

### Option 1: Deploy on Replit (Recommended)
This application is already configured for Replit deployment.

1. **Publish Your Repl**
   - Click the "Publish" button in Replit
   - Your app will be available at `https://your-repl-name.replit.app`

2. **Environment Variables**
   - No additional environment variables needed
   - Socket.io automatically connects to the same origin

### Option 2: Deploy Frontend (Netlify) + Backend (Render/Railway)

#### Backend Deployment (Render or Railway)

**For Render:**
1. Create a new Web Service on Render
2. Connect your GitHub repository
3. Configure build settings:
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Environment**: Node
4. Deploy and note your backend URL (e.g., `https://your-app.onrender.com`)

**For Railway:**
1. Create a new project on Railway
2. Connect your GitHub repository
3. Railway will auto-detect Node.js
4. Deploy and note your backend URL (e.g., `https://your-app.railway.app`)

#### Frontend Deployment (Netlify)

1. **Update Socket.io Connection**
   - Create `.env` file in frontend:
   ```
   VITE_SOCKET_URL=https://your-backend-url.onrender.com
   ```

2. **Update Frontend Code** (`client/src/hooks/useSocketIO.ts`):
   ```typescript
   const socket = io(import.meta.env.VITE_SOCKET_URL || window.location.origin, {
     autoConnect: true,
   });
   ```

3. **Build Frontend**
   ```bash
   npm run build
   ```

4. **Deploy to Netlify**
   - Drag and drop the `dist/public` folder to Netlify
   - Or connect GitHub repository with build settings:
     - **Build Command**: `npm run build`
     - **Publish Directory**: `dist/public`
   - Add environment variable: `VITE_SOCKET_URL=https://your-backend-url.onrender.com`

---

## Separate Frontend/Backend Structure (Optional)

If you want to deploy frontend and backend separately with their own package.json:

### Backend Folder Structure
```
backend/
├── package.json
├── server.js
└── (server code)
```

**backend/package.json**:
```json
{
  "name": "video-chat-backend",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.18.0",
    "socket.io": "^4.6.0",
    "cors": "^2.8.5"
  }
}
```

### Frontend Folder Structure
```
frontend/
├── package.json
├── index.html
├── src/
└── (React app)
```

**frontend/package.json**:
```json
{
  "name": "video-chat-frontend",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build": "vite build"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "socket.io-client": "^4.6.0"
  },
  "devDependencies": {
    "vite": "^5.0.0",
    "@vitejs/plugin-react": "^4.2.0",
    "tailwindcss": "^3.4.0"
  }
}
```

---

## Environment Variables

### Frontend
- `VITE_SOCKET_URL` (optional): Backend Socket.io URL
  - Default: Same origin (for Replit or monorepo deployments)
  - Example: `https://your-backend.onrender.com`

### Backend
- No environment variables required for basic deployment
- Optional: `PORT` (defaults to 5000)

---

## Troubleshooting

### Camera/Microphone Access
- Browsers require HTTPS for camera access (except localhost)
- Make sure your deployment uses HTTPS
- Grant permissions when prompted

### Connection Issues
- Check browser console for errors
- Verify Socket.io connection (should show "connected" in console)
- Ensure CORS is properly configured if using separate domains

### WebRTC Connection Issues
- WebRTC requires STUN/TURN servers for connections across different networks
- The app uses Google's public STUN servers by default
- For production with better reliability, consider using a TURN server

### No Partner Found
- At least 2 users must click "Find Partner" to connect
- If testing alone, open two browser windows

---

## Features
- ✅ Random user matching
- ✅ WebRTC peer-to-peer video streaming
- ✅ Audio/video toggle controls
- ✅ Leave and find new partner
- ✅ Real-time connection status
- ✅ Responsive design
- ✅ Dark mode optimized
- ✅ No registration required

---

## Technical Stack
- **Frontend**: React, TypeScript, Tailwind CSS, Socket.io Client
- **Backend**: Node.js, Express, Socket.io
- **Video**: WebRTC (Browser Native API)
- **Signaling**: Socket.io WebSocket
- **Deployment**: Replit / Netlify + Render/Railway

---

## Security Considerations
- All video is peer-to-peer (not stored on server)
- No user data is collected or stored
- Use HTTPS in production
- Consider adding rate limiting for production use
- Consider adding moderation features for public deployment
