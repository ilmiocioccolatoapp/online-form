# Il Mio Cioccolato - Event Reservation Form

Production-ready static site package for immediate deployment.

## Files

- `index.html` - full reservation form and WhatsApp submit logic
- `netlify.toml` - Netlify deploy config
- `vercel.json` - Vercel deploy config
- `Dockerfile` - containerized deployment with Nginx
- `nginx.conf` - Nginx server config for static hosting
- `.gitignore` - common ignores

## 1) Fastest Deploy (No Build Needed)

### Netlify

1. Create a new site from this folder/repo.
2. Build command: leave empty.
3. Publish directory: `.`

### Vercel

1. Import this folder/repo.
2. Framework preset: `Other`.
3. Output directory: `.`

## 1.1) Render (with Environment Variable)

This project includes Render blueprint + env injection so you can set WhatsApp number from Render dashboard.

Files used:
- `render.yaml`
- `Dockerfile.render`
- `index.render.template.html`
- `scripts/start-render.sh`
- `.env.render.example`

Steps:
1. Push this folder to GitHub/GitLab.
2. In Render, create a new `Blueprint` from the repo.
3. Set environment variable `WHATSAPP_NUMBER` (format: country code + number, no `+`).
4. Deploy.

## 1.2) Render New Static Site (exact form values)

Use these values in Render's **New Static Site** page:

- Name: `reservationform`
- Branch: `main`
- Root Directory: leave empty
- Build Command: `./scripts/build-render-static.sh`
- Publish Directory: `dist`
- Environment Variable:
  - `WHATSAPP_NUMBER=971501234567`

Notes:
- Replace `971501234567` with your real business number (country code + number, no `+`, spaces, or dashes).
- This static flow uses `index.render.template.html` and generates `dist/index.html` during build.

## 2) Local Preview

Run from this folder:

```bash
python3 -m http.server 8080
```

Open `http://localhost:8080`.

## 3) Docker Deploy

```bash
docker build -t il-mio-cioccolato-form .
docker run -p 8080:80 il-mio-cioccolato-form
```

Open `http://localhost:8080`.

## Important Customization

Update your business WhatsApp number in `index.html`:

```html
<input type="hidden" id="whatsappNumber" value="971501234567">
```

Use country code + number without `+`, spaces, or dashes.
