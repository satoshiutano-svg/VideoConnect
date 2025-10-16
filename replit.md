# Random Video Chat Application

## Overview
A real-time random video chat application similar to Omegle, built with React, Socket.io, and WebRTC for peer-to-peer video connections.

## Features
- ✅ Random user matching with waiting queue
- ✅ WebRTC peer-to-peer video streaming (no video stored on server)
- ✅ Real-time connection status (Searching, Connecting, Connected, Disconnected)
- ✅ Audio/video toggle controls
- ✅ Leave and find new partner functionality
- ✅ Responsive design optimized for mobile and desktop
- ✅ Dark mode UI with stunning visual design
- ✅ No registration or sign-up required

## Tech Stack

### Frontend
- **React** with TypeScript for UI components
- **Tailwind CSS** for styling and responsive design
- **Socket.io Client** for real-time signaling
- **WebRTC** browser API for peer-to-peer video
- **Lucide React** for icons
- **Custom hooks** for WebRTC and Socket.io management

### Backend
- **Node.js** with Express
- **Socket.io** for WebRTC signaling server
- **TypeScript** for type safety
- Waiting queue system for user matching
- Automatic cleanup on disconnect

## Architecture

### WebRTC Signaling Flow
1. User clicks "Find Partner" → initializes camera/microphone
2. User joins waiting queue via Socket.io
3. When 2 users available → server pairs them
4. One user creates WebRTC offer → sent via Socket.io
5. Other user receives offer → creates answer → sent back
6. Both users exchange ICE candidates
7. WebRTC peer connection established
8. Video streams directly between users (P2P)

### Key Components
- `VideoChat.tsx` - Main page component with connection logic
- `useWebRTC.ts` - Custom hook managing WebRTC peer connections
- `useSocketIO.ts` - Custom hook for Socket.io client
- `StatusBadge.tsx` - Connection status indicator
- `VideoContainer.tsx` - Video display component (local/remote)
- `ControlBar.tsx` - Control buttons (find, leave, mute, camera)

### Backend Structure
- `server/routes.ts` - Socket.io signaling server with pairing logic
- Waiting queue for unmatched users
- Partner tracking for active connections
- Automatic cleanup on disconnect

## Project Structure
```
client/
├── src/
│   ├── components/     # UI components
│   ├── hooks/          # Custom React hooks
│   ├── pages/          # Page components
│   └── index.css       # Tailwind + custom styles
server/
├── routes.ts           # Socket.io signaling server
└── index.ts            # Express server setup
shared/
└── schema.ts           # TypeScript types for Socket.io events
```

## Recent Changes
- Implemented complete WebRTC signaling with Socket.io
- Fixed glare situation with deterministic offer creation
- Added ref-based stream storage to prevent race conditions
- Enhanced error handling with user-friendly toast notifications
- Created responsive video-first UI following design guidelines

## Development

### Running Locally
```bash
npm install
npm run dev
```
Open http://localhost:5000 in two browser windows to test video chat.

### Testing
Open multiple browser windows/tabs to simulate different users:
1. Grant camera/microphone permissions in both
2. Click "Find Partner" in both windows
3. Users will automatically pair and connect
4. Test mute, camera toggle, and leave functionality

## Deployment

### Current Setup (Replit)
- Click "Publish" to deploy
- App will be live at `https://your-repl-name.replit.app`
- No environment variables needed

### Alternative (Netlify + Render)
See DEPLOYMENT.md for detailed instructions on deploying frontend to Netlify and backend to Render/Railway.

## User Preferences
- Video-first design with minimal UI
- Dark mode optimized interface
- Responsive across all device sizes
- No user accounts or authentication
- Privacy-focused (P2P video, no server storage)

## Security & Privacy
- All video streams are peer-to-peer (not routed through server)
- No user data collected or stored
- No conversation history
- HTTPS required for camera access in production
- STUN servers used for NAT traversal

## Future Enhancements
- Text chat alongside video
- Interest tags for better matching
- Skip/next partner during active chat
- Connection quality indicators
- User reporting/moderation tools
- TURN server for improved connectivity

## Notes
- Camera and microphone permissions required
- Works best on modern browsers (Chrome, Firefox, Safari, Edge)
- For testing locally, use multiple browser windows/tabs
- For production, deploy with HTTPS enabled
