<!doctype html>
<html lang="fa" dir="rtl">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>پورتفولیو | نام شما</title>
  <meta name="description" content="نمونه‌کارها، مهارت‌ها و مسیر کاری من. یک پورتفولیو مینیمال، واکنش‌گرا و آمادهٔ انتشار روی GitHub Pages." />
  <meta name="theme-color" content="#0f172a" />
  <meta property="og:title" content="پورتفولیو | نام شما" />
  <meta property="og:description" content="نمونه‌کارها، مهارت‌ها و مسیر کاری من." />
  <meta property="og:type" content="website" />
  <meta property="og:image" content="" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;600;800&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    // Tailwind custom config
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: { sans: ['Vazirmatn', 'ui-sans-serif', 'system-ui', 'Segoe UI', 'Roboto'] },
          colors: {
            brand: {
              50: '#eef2ff', 100: '#e0e7ff', 200: '#c7d2fe', 300: '#a5b4fc', 400: '#818cf8',
              500: '#6366f1', 600: '#4f46e5', 700: '#4338ca', 800: '#3730a3', 900: '#312e81'
            }
          },
          boxShadow: {
            soft: '0 8px 30px rgba(2,6,23,.15)'
          }
        }
      },
      darkMode: 'class'
    }
  </script>
  <style>
    /* Smooth font */
    html { -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale; }
    /* Nice selection */
    ::selection{ background:#a5b4fc; color:#0f172a }
  </style>
  <script>
    // --- Theme persistence (Dark/Light) ---
    const storedTheme = localStorage.getItem('theme');
    if (storedTheme === 'dark' || (!storedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark');
    }
    function toggleTheme(){
      const isDark = document.documentElement.classList.toggle('dark');
      localStorage.setItem('theme', isDark ? 'dark' : 'light');
    }
  </script>
</head>
<body class="font-sans text-slate-800 dark:text-slate-100 bg-white dark:bg-slate-950">
  <!-- Background gradient -->
  <div class="fixed inset-0 -z-10 bg-[radial-gradient(1200px_600px_at_80%_-10%,_rgba(99,102,241,0.20),transparent),radial-gradient(800px_400px_at_20%_-20%,_rgba(56,189,248,0.18),transparent)] dark:bg-[radial-gradient(1200px_600px_at_80%_-10%,_rgba(99,102,241,0.15),transparent),radial-gradient(800px_400px_at_20%_-20%,_rgba(45,212,191,0.12),transparent)]"></div>

  <!-- Navbar -->
  <header class="sticky top-0 backdrop-blur supports-[backdrop-filter]:bg-white/60 dark:supports-[backdrop-filter]:bg-slate-950/50 border-b border-slate-200/60 dark:border-slate-800/60 z-50">
    <div class="max-w-6xl mx-auto px-4 py-3 flex items-center justify-between">
      <a href="#home" class="flex items-center gap-2">
        <span class="inline-flex h-8 w-8 items-center justify-center rounded-xl bg-gradient-to-br from-brand-500 to-cyan-400 text-white shadow-soft">ن</span>
        <span class="font-extrabold tracking-tight text-slate-900 dark:text-white">نام شما</span>
      </a>
      <nav class="hidden md:flex items-center gap-6 text-sm text-slate-600 dark:text-slate-300">
        <a href="#projects" class="hover:text-brand-600 dark:hover:text-brand-300">نمونه‌کارها</a>
        <a href="#skills" class="hover:text-brand-600 dark:hover:text-brand-300">مهارت‌ها</a>
        <a href="#experience" class="hover:text-brand-600 dark:hover:text-brand-300">تجربه</a>
        <a href="#contact" class="hover:text-brand-600 dark:hover:text-brand-300">ارتباط</a>
      </nav>
      <div class="flex items-center gap-2">
        <a href="resume.pdf" class="hidden sm:inline-flex rounded-2xl border border-slate-300/70 dark:border-slate-700 px-3 py-1.5 text-sm hover:shadow-soft transition" download>دانلود رزومه</a>
        <button onclick="toggleTheme()" aria-label="Toggle theme" class="inline-flex h-9 w-9 items-center justify-center rounded-xl border border-slate-300/60 dark:border-slate-700 hover:shadow-soft transition">
          <!-- Sun/Moon icon -->
          <svg class="block dark:hidden" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="4"/><path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M4.93 19.07l1.41-1.41M17.66 6.34l1.41-1.41"/></svg>
          <svg class="hidden dark:block" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
        </button>
      </div>
    </div>
  </header>

  <!-- Hero -->
  <section id="home" class="max-w-6xl mx-auto px-4 py-16 md:py-24">
    <div class="grid md:grid-cols-2 items-center gap-10">
      <div>
        <span class="inline-flex items-center gap-2 rounded-full bg-white/70 dark:bg-slate-900/60 border border-slate-200/70 dark:border-slate-800 px-3 py-1 text-xs text-slate-600 dark:text-slate-300 shadow-soft">
          <span class="h-2 w-2 rounded-full bg-brand-500 animate-pulse"></span>
          در دسترس برای همکاری آزاد
        </span>
        <h1 class="mt-5 text-3xl sm:text-4xl md:text-5xl font-extrabold leading-tight text-slate-900 dark:text-white">
          سلام! من <span class="text-transparent bg-clip-text bg-gradient-to-l from-brand-500 to-cyan-400">نام شما</span> هستم.
        </h1>
        <p class="mt-4 text-slate-600 dark:text-slate-300 leading-8">
          طراح گرافیک و طراح UI/UX با تمرکز روی ساخت تجربه‌های ساده و خوش‌حس. عاشق مینیمالیسم، حرکت‌های نرم و کدنویسی تمیز.
        </p>
        <div class="mt-6 flex flex-wrap gap-3">
          <a href="#projects" class="inline-flex items-center justify-center gap-2 rounded-2xl bg-gradient-to-l from-brand-600 to-cyan-500 text-white px-5 py-2.5 shadow-soft hover:opacity-95 transition">
            مشاهده نمونه‌کارها
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
          </a>
          <a href="#contact" class="inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-300/70 dark:border-slate-700 px-5 py-2.5 hover:shadow-soft transition">ارتباط بگیریم</a>
        </div>
        <div class="mt-6 flex items-center gap-4 text-slate-500">
          <a href="#" aria-label="GitHub" class="hover:text-slate-900 dark:hover:text-white transition">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path fill-rule="evenodd" d="M12 2a10 10 0 0 0-3.162 19.492c.5.092.683-.217.683-.483 0-.237-.009-.866-.013-1.7-2.778.603-3.364-1.34-3.364-1.34-.454-1.154-1.11-1.462-1.11-1.462-.908-.62.069-.608.069-.608 1.004.07 1.532 1.032 1.532 1.032.892 1.53 2.341 1.088 2.91.833.091-.646.35-1.089.636-1.34-2.22-.252-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.03-2.683-.104-.253-.447-1.27.098-2.646 0 0 .84-.269 2.75 1.025A9.564 9.564 0 0 1 12 6.844c.85.004 1.705.115 2.504.337 1.909-1.294 2.748-1.025 2.748-1.025.546 1.376.203 2.393.1 2.646.64.699 1.028 1.592 1.028 2.683 0 3.842-2.34 4.688-4.566 4.936.359.31.678.923.678 1.861 0 1.345-.012 2.43-.012 2.761 0 .268.18.58.688.481A10 10 0 0 0 12 2Z" clip-rule="evenodd"/></svg>
          </a>
          <a href="#" aria-label="Dribbble" class="hover:text-slate-900 dark:hover:text-white transition">
            <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 2C6.477 2 2 6.477 2 12c0 4.125 2.49 7.668 6.046 9.23.02-.76.11-1.86.43-3.17.31-1.27 2.1-8.56 2.1-8.56s-.53-1.07-.53-2.65c0-2.48 1.44-4.33 3.22-4.33 1.52 0 2.26 1.14 2.26 2.51 0 1.53-.98 3.82-1.49 5.94-0.43 1.78.91 3.22 2.68 3.22 3.22 0 5.68-3.39 5.68-8.25 0-3.95-2.84-6.64-6.91-6.64C9.17 0 6 3.17 6 7.08c0 1.29
