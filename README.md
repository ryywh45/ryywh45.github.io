# James.dev

My personal dev blog. Built with Astro + Tailwind CSS, deployed to GitHub Pages.

## Tech Stack

- **Framework**: Astro (SSG)
- **Styling**: Tailwind CSS v4 + `@tailwindcss/typography`
- **Content**: Astro Content Collections (Markdown)
- **Deploy**: GitHub Actions → GitHub Pages

## Write & Publish

```bash
# 1. create today's post
./new_post.sh

# 2. edit src/content/blog/YYYY-MM-DD.md

# 3. push
git add . && git commit -m "daily" && git push
```

GitHub Actions picks up the push and deploys automatically.

## Local Dev

```bash
npm run dev      # dev server at localhost:4321
npm run build    # build to ./dist/
npm run preview  # preview the build
```
