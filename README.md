 🎵 Music Web App



A full-stack music platform that displays songs, artists, albums, genres, and playlists.  

Built using Node.js, Express, PostgreSQL, and EJS.



\---



 🚀 Features



\- View songs with artist, album, and genre

\- Display latest uploads

\- View comments on songs

\- Browse playlists created by users

\- View songs by artist

\- Delete songs (with cascading delete)



\---



\## 🛠️ Tech Stack



\- \*\*Backend:\*\* Node.js, Express.js

\- \*\*Frontend:\*\* EJS, HTML, CSS

\- \*\*Database:\*\* PostgreSQL

\- \*\*Deployment:\*\* Render (backend), Neon (database)



\---



\## 📁 Project Structure

music-web-app/

│

├── backend/

│ ├── app.js # Main server file

│ ├── db.js # Database connection

│ ├── views/ # EJS templates

│ └── public/ # Static files (CSS)

│

├── schema.sql # Database schema + data

├── package.json

├── .env # Environment variables (not pushed)

└── README.md







\---



\## ⚙️ Setup Instructions (Local)



\### 1. Clone the repository



git clone https://github.com/Ani2708/music-web-app.git

cd music-web-app





\---



\### 2. Install dependencies

npm install





\---



\### 3. Setup PostgreSQL



\- Create a database:



CREATE DATABASE music\_system;



\- Import schema:



psql -U postgres -d music\_system -f music\_system.sql





\---



\### 4. Create `.env` file



DB\_USER=postgres

DB\_HOST=localhost

DB\_NAME=music\_system

DB\_PASSWORD=your\_password

DB\_PORT=5432





\---



\### 5. Run the application



npm start





Open in browser:



http://localhost:3000





\---



\## 🌐 Deployment



\- Backend hosted on Render

\- Database hosted on Neon



Environment variables must be configured on Render.



\---



\## 🐛 Known Issues



\- Duplicate songs may appear due to SQL joins (handled in backend logic)

\- Requires PostgreSQL setup before running



\---



\## 👥 Contributors



\- Anirudh A S

\- Karen P



\---



\## 📌 Notes



\- `.env` file is not included for security reasons

\- Use `schema.sql` to recreate database

\- Ensure correct DB credentials before running



\---



\## 📄 License



This project is for academic purposes.

