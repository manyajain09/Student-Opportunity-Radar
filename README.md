# Student Opportunity Radar (Java Swing desktop app)

Create a Student ID, browse six categories of opportunities, and register for them.

| Category | What it covers |
|---|---|
| Scholarships | Financial assistance for students |
| Internships | Practical work experience in companies |
| Competitions & Hackathons | Coding contests and project competitions |
| Certifications | Free or paid courses |
| Jobs & Placements | Entry-level jobs and campus drives |
| Workshops & Events | Workshops, seminars, career events |

## Run (needs JDK 11 or newer - no other downloads)
- Windows: double-click `run.bat`
- Linux / macOS: `./run.sh`
- Manual: `mkdir out && javac -encoding UTF-8 -d out $(find src -name "*.java") && java -cp out com.radar.Main`

## Features
- **Create Student ID** (e.g. `STU20260001`) with name, email, college, branch, year, interests, password (salted SHA-256)
- **Login** with Student ID + password
- **Dashboard**: stats, search, sort by deadline / newest / title, "open only", "match my interests"
- **One page per category** with cards, deadline badges ("Closes in 2 days")
- **Details dialog**: benefit, eligibility, dates, description, open website link
- **Register** (phone + note, confirmation, unique Registration ID like `REG-00001`), duplicate and closed-deadline checks
- **My Registrations**: view and cancel
- **My Profile**: edit details/interests, change password
- **Admin Panel** (login `ADMIN` / `admin123`): add, edit, delete opportunities, view registrants

## Architecture
```
src/com/radar
  Main.java
  model/    Student, Opportunity, Registration, Category      (data classes)
  data/     DataStore (persistence), SeedData (sample data)   (storage layer)
  service/  AuthService, OpportunityService, RegistrationService  (backend logic)
  ui/       LoginFrame, MainFrame, OpportunityListPanel, ...  (Swing frontend)
  util/     PasswordUtil
```
Data is saved automatically to `~/.opportunity-radar/radar.dat`. Delete that file to reset the app.
Sample opportunities are created on first run with deadlines relative to today. Their links and details are placeholders, so use the Admin Panel to replace them with real ones.

## Using MySQL / SQLite later
All storage goes through `DataStore` and the three service classes, so the UI never touches storage directly.
To switch to a real database, replace the service method bodies with JDBC calls and keep the signatures.
