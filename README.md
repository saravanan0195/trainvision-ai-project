# Rail Traffic Decision Support System

A full-stack railway traffic optimization system with real-time scheduling, conflict resolution, and manual override capabilities.

## 🚀 System Overview

This system simulates a railway control center with intelligent train scheduling optimization and manual controller override capabilities. It demonstrates how modern railway systems handle platform conflicts, train delays, and real-time decision making.

### Key Features
- **Intelligent Scheduling**: Greedy optimization algorithm for platform assignment
- **Real-time Dashboard**: Live visualization of train movements and schedules
- **Manual Override System**: Controller can force train platform assignments
- **Conflict Resolution**: Automatic delay calculation and conflict resolution
- **Audit Trail**: Complete logging of all scheduling decisions and overrides
- **Interactive Testing**: Conflict simulation panel for testing scenarios

## 🏗️ Architecture

```
┌─────────────────┐    HTTP/REST API    ┌─────────────────┐
│                 │ ←─────────────────→ │                 │
│   Frontend      │                     │   Backend       │
│   (React +      │                     │   (FastAPI +    │
│   TypeScript +  │                     │   Python)       │
│   Tailwind)     │                     │                 │
│                 │                     │                 │
└─────────────────┘                     └─────────────────┘
      Port 5173                              Port 8000
```

### Technology Stack
**Frontend:**
- React 19 with TypeScript
- Vite for fast development
- Tailwind CSS 3 for styling
- Real-time data visualization

**Backend:**
- FastAPI (Python)
- Pydantic for data validation
- Greedy optimization algorithm
- RESTful API design

## 🚦 Quick Start

### Prerequisites
- **Python 3.8+** (for backend)
- **Node.js 18+** (for frontend)
- **Git** (for version control)

### 1. Clone Repository
```bash
git clone <repository-url>
cd SIH_2025
```

### 2. Start Backend
```bash
cd backend
python -m venv venv

# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

pip install fastapi uvicorn pydantic
python main.py
```
Backend will run on: `http://localhost:8000`

### 3. Start Frontend
```bash
cd rail-frontend
npm install
npm run dev
```
Frontend will run on: `http://localhost:5173`

### 4. Access Application
Open your browser to `http://localhost:5173` and start testing the system!

## 🎯 How to Use

### Basic Operation
1. **View Dashboard**: See real-time train schedules and platform assignments
2. **Check KPIs**: Monitor on-time performance and delay statistics
3. **Explore Network Map**: Visual representation of the 3-station network
4. **Refresh All**: Use the green "Refresh All" to reload stations, dataset and schedule

### Testing Conflicts
1. **Use Conflict Simulation Panel**: 
   - Select two trains (e.g., T101 and T104)
   - Force both to Platform 1
   - Watch the system resolve conflicts automatically

2. **Manual Override Testing**:
   - Select any train (e.g., T105 Freight)
   - Try to move it to Platform 1
   - System will either allow or show conflict resolution

3. **View Audit Logs (Modal)**:
   - Click the "📋 Audit Logs" button in the header
   - A modal opens with detailed conflict/override reasoning
   - The separate inline audit log section was removed to keep the dashboard focused

### Sample Test Scenario
```
1. Force T101 (Express, Priority 8) to Platform 1 ✅
2. Force T105 (Freight, Priority 2) to Platform 1 ✅
3. System automatically delays T105 or assigns different platform
4. Check audit logs to see detailed resolution explanation
```

## 📊 System Data

### Railway Network
- **HYB**: Hyderabad Deccan (3 platforms)
- **SC**: Secunderabad Junction (4 platforms)
- **KCG**: Kacheguda (2 platforms)

### Sample Trains
- **T101**: Express (Priority 8) - HYB→SC
- **T102**: Local (Priority 5) - SC→KCG  
- **T103**: Passenger (Priority 6) - KCG→HYB
- **T104**: Express (Priority 9) - HYB→KCG
- **T105**: Freight (Priority 2) - SC→HYB

All trains scheduled around 09:00-09:45 to create realistic conflicts.

## 🔧 Development

### Project Structure
```
SIH_2025/
├── backend/                 # FastAPI backend
│   ├── main.py              # API routes and server
│   ├── models.py            # Data models
│   ├── optimizer.py         # Scheduling algorithm
│   ├── data/
│   │   └── prototype_trains.json
│   └── requirements.txt     # Backend deps (optional; pip install -r)
├── rail-frontend/           # React frontend (Vite + TS + Tailwind)
│   ├── src/
│   │   ├── App.tsx          # Main application UI
│   │   └── index.css        # Tailwind styles
│   ├── tailwind.config.js   # Tailwind configuration
│   ├── vite.config.ts       # Vite config
│   └── package.json         # Frontend deps & scripts
└── README.md                # This consolidated guide (only README)
```

### API Endpoints
- `GET /stations` - Railway stations
- `GET /schedule` - Optimized train schedule
- `POST /override` - Manual platform override
- `GET /log` - Audit trail
- `GET /baseline` - Baseline schedule used for comparison (if available)
- `POST /simulate-override` - Predict delay impact for a prospective override
- `GET /docs` - Interactive API documentation

### Key Algorithms
1. **Greedy Optimizer**: Assigns platforms based on priority and arrival time
2. **Conflict Resolution**: Delays lower-priority trains when conflicts occur
3. **Controller Override**: Forces assignments regardless of priority
4. **Audit Logging**: Tracks all decisions with detailed reasoning

## 🐛 Troubleshooting

### Common Issues
1. **Backend not starting**: Check Python version and dependencies
2. **Frontend not connecting**: Ensure backend is running on port 8000
3. **CORS errors**: Backend has CORS enabled for development
4. **Port conflicts**: Change ports in configuration files

### Debug Mode
- Backend: Check `http://localhost:8000/docs` for API documentation
- Frontend: Open browser developer tools for console logs
- Logs: Use "📋 Audit Logs" button to see system decisions

## 🚀 Production Deployment

### Backend
```bash
pip install gunicorn
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

### Frontend
```bash
npm run build
# Deploy dist/ folder to static hosting
```

## 📝 Features Demonstrated

### Railway Operations
- ✅ **Platform Assignment Optimization**
- ✅ **Train Priority Management**
- ✅ **Conflict Detection and Resolution**
- ✅ **Manual Controller Overrides**
- ✅ **Real-time Schedule Updates**
- ✅ **Delay Calculation and Tracking**
- ✅ **Before/After Gantt Charts (side by side)**
- ✅ **Delay KPI cards showing avg and total minutes (before/after)**

### Software Engineering
- ✅ **Full-stack Architecture**
- ✅ **RESTful API Design**
- ✅ **Real-time Data Visualization**
- ✅ **TypeScript Type Safety**
- ✅ **Responsive UI with Tailwind CSS**
- ✅ **Algorithm Implementation**

## 🎓 Educational Value

This system demonstrates:
- **Operations Research**: Optimization algorithms in practice
- **Software Architecture**: Full-stack application design
- **Real-time Systems**: Live data updates and user interaction
- **Domain Modeling**: Railway operations and constraints
- **User Experience**: Control room interface design

## 📄 License

This project is a demonstration system for railway traffic optimization concepts.

---

**Ready to explore railway traffic optimization? Start both servers and begin testing!** 🚂
