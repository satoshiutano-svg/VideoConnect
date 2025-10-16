# Design Guidelines: Real-Time Video Chat Application

## Design Approach
**Selected Approach:** Material Design-inspired utility-focused interface
**Rationale:** Video chat applications prioritize functionality, clear status feedback, and minimal distractions. The interface should get out of the way and let video communication be the star.

---

## Core Design Philosophy
This is a **video-first** application where the user's camera feed and partner's video occupy 80%+ of screen real estate. All UI elements serve the singular purpose of facilitating seamless video connections.

---

## Color Palette

### Dark Mode (Primary)
- **Background Base:** 220 15% 8% (deep charcoal)
- **Surface:** 220 12% 12% (slightly lighter panels)
- **Border/Divider:** 220 10% 18%
- **Primary Action:** 210 100% 56% (vibrant blue for "Find Partner")
- **Danger/Leave:** 0 72% 51% (red for disconnect)
- **Success/Connected:** 142 71% 45% (green for connection status)
- **Warning/Searching:** 45 93% 47% (amber for loading state)
- **Text Primary:** 0 0% 98%
- **Text Secondary:** 220 9% 65%

### Light Mode (Optional Alternative)
- **Background:** 0 0% 98%
- **Surface:** 0 0% 100%
- **Primary:** 210 100% 48%

---

## Typography
- **Font Family:** 'Inter' or 'SF Pro Display' from Google Fonts
- **Headings:** 600-700 weight, sizes: text-2xl to text-4xl
- **Body Text:** 400-500 weight, text-base to text-lg
- **Status Indicators:** 600 weight, text-sm to text-base, uppercase tracking-wide
- **Button Labels:** 600 weight, text-sm to text-base

---

## Layout System

### Spacing Scale
Use **Tailwind units of 2, 4, 6, 8, 12, 16** for consistent rhythm (p-4, m-8, gap-6, etc.)

### Container Strategy
- **Full viewport utilization:** Application fills 100vh and 100vw
- **Video container:** Takes 85-90% of viewport height
- **Control bar:** Fixed at bottom, h-16 to h-20
- **Status overlay:** Absolute positioned, top-4 or top-6

### Responsive Breakpoints
- **Mobile (< 768px):** Single column, stacked video layout
- **Tablet (768px - 1024px):** Optimized video aspect ratios
- **Desktop (> 1024px):** Side-by-side video feeds (local smaller, remote larger)

---

## Component Library

### 1. Video Display Components

**Primary Video Container (Remote Stream)**
- Position: Occupies majority of screen (60-70% width on desktop)
- Aspect ratio: 16:9 or 4:3 maintained with object-fit: cover
- Border radius: rounded-lg
- Background: Solid dark color when no stream (220 15% 8%)
- Loading state: Animated gradient shimmer effect

**Secondary Video Container (Local Stream)**
- Position: Fixed overlay, bottom-right corner (or bottom-left)
- Size: 200-280px width on desktop, 120-160px on mobile
- Border: 2px solid with 220 10% 18% color
- Draggable positioning (optional enhancement)
- Mirror effect for user's own video

### 2. Status Indicators

**Connection Status Badge**
- Position: Fixed top-center or top-left
- Variants:
  - Searching: Pulsing amber dot + "Searching for partner..."
  - Connected: Solid green dot + "Connected"
  - Disconnected: Red dot + "Partner left"
- Padding: px-6 py-3
- Border radius: rounded-full
- Background: Semi-transparent backdrop blur (bg-black/40 backdrop-blur-sm)

### 3. Control Buttons

**Find Partner Button (Primary CTA)**
- Size: Large - px-8 py-4 on desktop, px-6 py-3 on mobile
- Color: Primary blue (210 100% 56%)
- States: Default, Hover (brightness boost), Active (slight scale), Disabled (50% opacity)
- Icon: Video camera or search icon left-aligned
- Full width on mobile

**Leave/Next Button (Secondary Action)**
- Style: Outline variant with red accent or solid red background
- Position: Adjacent to Find Partner or floating on video
- Icon: X or skip icon
- Hover: Red fill with white text

**Mute/Camera Toggle** (During Call)
- Position: Bottom control bar, centered or left-aligned
- Style: Icon-only circular buttons (w-12 h-12)
- Background: Surface color with subtle border
- Active state: Slash through icon when muted/disabled

### 4. Empty States

**No Partner Found**
- Centered illustration or icon (video camera with slash)
- Heading: "No one available right now"
- Subtext: "Click 'Find Partner' to search"
- Subtle animation: Gentle fade-in

**Waiting/Searching State**
- Animated loading spinner or ripple effect
- Progress indicator (optional): "Searching... 00:15"
- Cancel button beneath

---

## Visual Hierarchy

1. **Remote video stream** (dominant visual element - 60-70% viewport)
2. **Connection status** (top overlay - immediately visible)
3. **Control buttons** (bottom fixed bar - always accessible)
4. **Local video preview** (subtle, corner positioned - 15% viewport)

---

## Animations & Interactions

**Minimal Animation Strategy:**
- Button hover: Subtle scale(1.05) transform, 200ms ease
- Status changes: 300ms fade transitions
- Video loading: Skeleton shimmer (2s loop)
- Connection established: Brief green flash border on video container
- Partner disconnect: Fade-out remote video (500ms)

**NO excessive animations** - this is a functional tool, not an entertainment app

---

## Accessibility Considerations

- High contrast ratios for all text (WCAG AA minimum)
- Focus indicators: 2px blue outline on all interactive elements
- Keyboard navigation: Tab through Find Partner → Leave → Mute → Camera
- Screen reader labels for all icon buttons
- Status announcements via aria-live regions
- Video elements with proper alt attributes/labels

---

## Images
No hero images required. This is a video-first functional application where user camera feeds are the primary visual content.

---

## Mobile Optimization

- Touch targets: Minimum 44x44px for all buttons
- Video containers: Stack vertically (remote on top, local below)
- Status badge: Reduced size, top-center position
- Control bar: Full-width bottom sheet with larger buttons
- Prevent layout shift during status changes

---

## Key Success Metrics
- Video streams occupy 80%+ of viewport at all times
- Connection status visible within 100ms of state change
- Single-click access to core actions (Find, Leave, Mute)
- Zero decorative elements that distract from video communication