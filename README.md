# Impact Desk

A fundraising activity planner for nonprofit fundraising managers and development staff who need to organize in-person donor meetings, visits, and events more efficiently.

Unlike generic CRM systems, ImpactDesk is built specifically for in-person donor relationship work and daily fundraising coordination. Users can schedule relationship-building activities, filter them by day, and view addresses on an interactive map for better route planning.

## Tech Stack

- **Frontend:** React 19 (Vite), Material UI, Leaflet, SWR, Axios, Day.js
- **Backend:** Django, Django REST Framework, PostgreSQL
- **Infrastructure:** Docker Compose, Nginx

## Getting Started

1. Clone repository
2. From the root directory
   ```
   ./run-compose-dev.sh
   ```
3. Open browser to [http://localhost:5173/](http://localhost:5173/)

(Optional) Create a `frontend/.env` for map geocoding:
```
VITE_GEOCODE_KEY=<your-google-geocode-api-key>
```

## Features

- **User Authentication** -- Sign up, log in with token, and log out. All dashboard routes and API endpoints protected.
- **Development Scheduling** -- Create meetings, visits, and events with contacts. Filter schedule by day.
- **Interactive Map** -- Addresses are geocoded and displayed as markers on a Leaflet map to plan in-person visits.
- **Contact Management** -- Track people and organizations with full address and contact details.
- **Donation Tracking** -- View monthly donation bar chart and top donor summary.
- **Dashboard Overview** -- At-a-glance cards , schedule count, total donations, a donation chart, and a top donors list.

## Data Model


| Model             | Key Fields                                                         | Relationships                                     |
| ----------------- | ------------------------------------------------------------------ | ------------------------------------------------- |
| **People**        | first_name, last_name, phone, email, address fields                | Has many Donations, has many Developments         |
| **Organizations** | title, website, phone, email, address fields                       | Has many Donations, has many Developments         |
| **Donations**     | donations (amount), donate_type, date                              | ForeignKey to People, ForeignKey to Organizations |
| **Developments**  | type, date, time, end_time, status, note, address fields, lat, lng | ForeignKey to People, ForeignKey to Organizations |


## API Endpoints


| Endpoint                  | Methods          | Description                                            |
| ------------------------- | ---------------- | ------------------------------------------------------ |
| `/auth/signup`            | POST             | Create a new user account                              |
| `/auth/get-token`         | POST             | Obtain auth token with credentials                     |
| `/auth/users`             | GET              | Get authenticated user profile                         |
| `/api/people/`            | GET, POST        | List or create contacts                                |
| `/api/people/<id>`        | GET, PUT, DELETE | Retrieve, update, or delete a contact                  |
| `/api/organizations/`     | GET, POST        | List or create organizations                           |
| `/api/organizations/<id>` | GET, PUT, DELETE | Retrieve, update, or delete an org                     |
| `/api/donations/`         | GET, POST        | List or create donations                               |
| `/api/donations/<id>`     | GET, PUT, DELETE | Retrieve, update, or delete a donation                 |
| `/api/developments/`      | GET, POST        | List or create developments (supports `?date=` filter) |
| `/api/developments/<id>`  | GET, PUT, DELETE | Retrieve, update, or delete a development              |


