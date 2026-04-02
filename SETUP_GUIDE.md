# 🚂 Train Vision AI - Setup & Implementation Guide

Complete guide to set up and run the real-time train control system with live data integration.

## 📋 Prerequisites

- **Node.js** 16 or higher
- **npm** or **yarn**
- **Git** (optional)

Verify installation:
```bash
node --version
npm --version
```

## 🚀 Installation Steps

### Step 1: Frontend Setup

1. **Navigate to frontend directory**
   ```bash
   cd margdarshak-train-control-system-main
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

   This will install all required packages including:
   - React 18
   - Tailwind CSS
   - Socket.io-client (for real-time updates)
   - React Router
   - And many UI components

3. **Create environment file** (if not exists)
   
   Create `.env` in root directory:
   ```env
   VITE_BACKEND_URL=http://localhost:3001
   ```

### Step 2: Backend Setup

1. **Open a new terminal and navigate to backend**
   ```bash
   cd margdarshak-train-control-system-main/backend
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

   This will install:
   - Express.js
   - Socket.io
   - TypeScript
   - Axios (for API calls)
   - And utilities (cors, dotenv)

3. **Configure environment**
   
   Update `backend/.env`:
   ```env
   # Required
   BACKEND_PORT=3001
   FRONTEND_URL=http://localhost:8080
   NODE_ENV=development

   # For real train data (optional - default uses mock data)
   RAILWAY_API_KEY=your_api_key_here
   RAILWAY_API_URL=https://railwayapi.com/api
   ```

## ▶️ Running the Application

### Terminal 1: Start Backend Server

```bash
cd backend
npm run dev
```

Expected output:
```
╔════════════════════════════════════════════╗
║   🚂 Train Vision AI Backend Server 🚂    ║
║   Running on http://localhost:3001        ║
║   WebSocket: ws://localhost:3001          ║
╚════════════════════════════════════════════╝
```

### Terminal 2: Start Frontend Server

```bash
npm run dev
```

Expected output:
```
  VITE v5.4.19  ready in 1234 ms

  ➜  Local:   http://localhost:8080/
  ➜  press h + enter to show help
```

### ✅ Success!

1. Open browser to `http://localhost:8080`
2. Click on "Live Simulation" or "Live Tracker" to see real-time data
3. Check browser console for connection logs
4. Backend terminal will show client connection messages

## 🗺️ Available Routes

After starting both servers, access these pages:

| Route | Description |
|-------|-------------|
| `/` | Landing page with overview |
| `/dashboard` | Main control dashboard |
| `/live-tracker` | 🆕 Real-time train tracking (NEW!) |
| `/simulation` | Train simulation view |
| `/ai-decision` | AI decision support |
| `/weather-impact` | Weather impact analysis |
| `/assistant` | Train Vision AI chatbot |

## 🔌 How Real-Time Data Works

### Architecture Flow

```
┌─────────────────────────────────────┐
│  Train API / Mock Data Generator    │
│  (Railway API or Random Data)       │
└────────────┬────────────────────────┘
             │ (Every 5 seconds)
             ▼
┌─────────────────────────────────────┐
│  Backend Server (Node.js/Express)   │
│  - Fetch train data                 │
│  - Process & generate alerts        │
│  - Calculate statistics             │
└────────────┬────────────────────────┘
             │ (WebSocket/REST APIs)
             ▼
┌─────────────────────────────────────┐
│  Frontend (React)                   │
│  - Display live updates             │
│  - Show train locations             │
│  - Display alerts & statistics      │
└─────────────────────────────────────┘
```

### Data Flow

1. **Server fetches train data** → Every 5 seconds
2. **Server broadcasts via WebSocket** → To all connected clients
3. **Frontend receives in real-time** → Updates display instantly
4. **No page refresh needed** → Seamless live updates

## 📊 Backend Data Sources

### Option 1: Mock Data (Default)
- Pre-defined train data with random variations
- Perfect for development & testing
- No API key required

### Option 2: Real Railway APIs

#### Free Options:
- **OpenWeatherMap Free Tier**
  - 1000 calls/day
  - Weather data for train impact analysis
  - Sign up: https://openweathermap.org/api

#### Paid Options:
- **IRCTC Official API** (Enterprise)
  - Most accurate Indian Railways data
  - Contact: contactus@irctc.co.in

- **RapidAPI Plans**
  - Various Indian Railways APIs
  - Pricing: $0-100/month
  - https://rapidapi.com/

#### Integration Steps:

1. Get API credentials from provider
2. Update `backend/.env`:
   ```env
   RAILWAY_API_KEY=your_api_key
   RAILWAY_API_URL=https://api.provider.com
   ```

3. Update `backend/src/services/railwayService.ts` - uncomment `fetchFromRailwayAPI()` function

4. Restart backend server

## 📦 Project Structure

```
train-vision-ai/
├── backend/                          ← Real-time server
│   ├── src/
│   │   ├── server.ts                ← Express + WebSocket setup
│   │   ├── services/
│   │   │   └── railwayService.ts    ← Train data fetching
│   │   └── types/
│   │       └── index.ts             ← TypeScript types
│   ├── package.json
│   └── .env
│
├── src/                              ← React frontend
│   ├── pages/
│   │   ├── Landing.tsx              ← Home page
│   │   ├── Dashboard.tsx            ← Main dashboard
│   │   └── ...
│   ├── components/
│   │   ├── railway/
│   │   │   └── LiveTrainTracker.tsx  ← 🆕 Live tracker (NEW!)
│   │   └── ...
│   ├── hooks/
│   │   └── useTrainData.ts           ← Real-time data hook
│   ├── App.tsx                       ← Routes config
│   └── main.tsx                      ← Entry point
│
├── package.json                      ← Frontend dependencies
├── .env                              ← Frontend env vars
└── README.md
```

## 🎯 Key Features Implemented

✅ **Real-Time WebSocket Connection**
- Automatic reconnection on disconnect
- Handles connection errors gracefully

✅ **Mock Train Data**
- 5 realistic sample trains
- Random variations (speed, delay, occupancy)

✅ **Live Dashboard**
- Train statistics (total, delayed, on-time)
- Active alerts with severity levels
- Detailed train table with all metrics

✅ **REST API Endpoints**
- `/api/health` - Server status
- `/api/trains` - Current train data
- `/api/alerts` - Active alerts
- `/api/statistics` - Aggregate stats

✅ **Error Handling**
- Connection error messages
- Automatic reconnection
- Fallback to mock data if API fails

## 🔧 Troubleshooting

### Issue: Backend won't start
```bash
# Check if port 3001 is in use
netstat -an | grep 3001

# Change port in backend/.env
BACKEND_PORT=3002
```

### Issue: Frontend can't connect to backend
1. Verify backend is running on `http://localhost:3001`
2. Check `.env` file: `VITE_BACKEND_URL=http://localhost:3001`
3. Check browser console for CORS errors
4. Try restarting both servers

### Issue: No train data showing
1. Check backend logs for errors
2. Verify `.env` configuration
3. Try mock data (default behavior)
4. Check network tab in browser DevTools

### Issue: WebSocket disconnect/reconnect loops
1. Check backend logs
2. Ensure `FRONTEND_URL` in `backend/.env` is correct
3. Try clearing browser cache
4. Restart both servers

## 📚 API Examples

### Using REST API with cURL

```bash
# Get all trains
curl http://localhost:3001/api/trains

# Get alerts
curl http://localhost:3001/api/alerts

# Get statistics
curl http://localhost:3001/api/statistics

# Check health
curl http://localhost:3001/api/health
```

### Using WebSocket (in browser console)

```javascript
const socket = io('http://localhost:3001');

// Listen for updates
socket.on('train_update', (trains) => {
  console.log('Trains:', trains);
});

// Request data
socket.emit('request_train_data', (trains) => {
  console.log('Response:', trains);
});
```

## 🚀 Production Deployment

### Build for Production

```bash
# Frontend
npm run build

# Backend
cd backend
npm run build
npm start
```

### Deploy to Heroku

```bash
# Install Heroku CLI
npm install -g heroku

# Create app
heroku create train-vision-ai

# Set environment variables
heroku config:set BACKEND_PORT=3000

# Deploy
git push heroku main
```

### Deploy to AWS/DigitalOcean

1. Create server instance
2. Install Node.js
3. Clone repository
4. Configure environment variables
5. Use PM2 for process management:
   ```bash
   npm install -g pm2
   pm2 start npm --name "backend" -- run start
   ```

## 📞 Support & Help

### Check Logs
```bash
# Backend logs
tail -f backend/npm-debug.log

# Frontend errors
# Open browser DevTools → Console tab
```

### Test Connectivity
```bash
# From browser console
fetch('http://localhost:3001/api/health')
  .then(r => r.json())
  .then(d => console.log(d))
```

## 🎓 Next Steps

1. **Integrate Real API**
   - Get API key from railway data provider
   - Update `railwayService.ts`
   - Test with real data

2. **Add Database**
   - Store historical train data
   - Implement analytics
   - Create reports

3. **Deploy Live**
   - Set up production environment
   - Configure real domain
   - Enable HTTPS

4. **Enhance ML**
   - Add delay prediction models
   - Implement route optimization
   - Add anomaly detection

## 📝 Notes

- Backend broadcasts data every 5 seconds
- Mock data includes 5 sample trains
- All updates are in real-time via WebSocket
- Fallback to mock data if API fails
- Frontend automatically reconnects on disconnect

---

**Ready to go!** 🚀 Your real-time train tracking system is now live!
