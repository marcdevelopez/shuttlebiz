# Wireframes & UI Mockups

Visual design progress and screen mockups for the **ShuttleBiz** mobile application. This directory contains comprehensive UI/UX documentation including wireframes, screen flows, and design specifications.

## 📁 Current Files

- **`all-screens-yet.pdf`** - Complete wireframe document showing current design progress
- **`screens-overview.png`** - Visual overview of all designed screens and navigation flow
- **`wireframes-v1.x`** - Future iterations and updates

## 📱 Screen Coverage Status

### ✅ **Completed Wireframes:**
- **Authentication Flow:**
  - Login with phone number (+34 format)
  - SMS verification code input
- **Onboarding & Home:**
  - Home screen (empty state)
  - Group creation modal
  - Home with existing groups
- **Shuttle Management:**
  - New Shuttle configuration screen (NewShuttleScreen)
  - Shuttle detail view with navigation tabs
  - Schedule, Date & Frequency selectors (Time/Date/Frequency pickers)
- **Navigation Structure:**
  - Bottom navigation with tabs (Plazas, Horarios, Chat, Mapa)
  - Top navigation bar with group selector

### 🔄 **In Progress:**
- Shuttle booking interface (seat request flow)
- Driver vs Passenger role selection
- Group member management screens

### ⏳ **Pending Design:**
- Chat interfaces (general group chat + specific ride chat)
- Real-time location tracking (Map view)
- Notification screens
- User profile & settings
- Advanced shuttle editing (conflict resolution)

## 🎨 Design System & Guidelines

### **Color Palette (from app logo):**
- **Primary Blue:** `#0077B6` - Used for "ida" (outbound) schedules
- **Coral Red:** `#FF6B6B` - Used for "vuelta" (return) schedules
- **Status Colors:**
  - 🟢 Green: Available shuttles with seats
  - 🔴 Red: Full shuttles or out of schedule
  - ⚪ Gray: Inactive/unavailable shuttles

### **Key UI Patterns:**
- **ExpansionTile** for schedule organization
- **BottomNavigationBar + PageView** for shuttle details
- **Modal sheets** for configuration (date, time, frequency)
- **Checkbox lists** for weekly frequency selection
- **Radio buttons** for mode selection (Date vs Frequency)

## 🛠️ Tools Used

- **[Miro](https://miro.com)** - Collaborative whiteboard for wireframes and app mockups
- **[Figma](https://figma.com)** - UI/UX design and prototyping (future use)

## 📋 Design Specifications Reference

All wireframes follow the detailed specifications outlined in [`../SPECIFICATIONS.md`](../SPECIFICATIONS.md), including:

- **Navigation flow:** Login → Home → Groups → Shuttles → Booking
- **User roles:** Passenger vs Driver selection per ride
- **Shuttle configuration:** Date/Frequency modes with conflict detection
- **Real-time features:** Chat, notifications, location tracking (future)

## 🔄 Version History

- **v1.0** (Current) - Initial wireframe set covering core MVP flows
- **v1.1** (Planned) - Booking interface and role selection refinements
- **v2.0** (Future) - Complete chat and map integration designs

## 📝 Notes

- All screens designed with **mobile-first** approach for Flutter development
- Wireframes include **state management considerations** (empty states, loading, errors)
- **Responsive design** principles applied for various screen sizes
- **Accessibility guidelines** will be incorporated in high-fidelity designs

---

*For technical implementation details, see [`../../SPECIFICATIONS.md`](../../SPECIFICATIONS.md)*  
*For development progress, check the main project [README.md](../../../README.md)*