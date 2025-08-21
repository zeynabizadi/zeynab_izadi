import React, { useEffect, useMemo, useState } from "react";
import { motion } from "framer-motion";
import {
  Github,
  Mail,
  MapPin,
  ExternalLink,
  Star,
  GitFork,
  Sun,
  Moon,
  Link as LinkIcon,
  Download,
} from "lucide-react";

/*
  ✅ How to use:
  1) Replace GITHUB_USERNAME and CONTACT_EMAIL below.
  2) Drop this component into a Vite + React + Tailwind project as src/App.jsx
  3) Run: npm install && npm run dev
  4) Deploy on GitHub Pages (instructions provided in the chat message).

  ✨ Features:
  - Live GitHub profile & repos fetch
  - Dark/Light theme toggle (remembers preference)
  - Animated hero + project cards (Framer Motion)
  - Pretty, modern Tailwind UI with glassmorphism
  - Projects sorted by stars & recent activity
  - Quick stats (followers, public repos, total stars)
  - Link buttons for CV, email, social, custom links
*/

// === CONFIG ===
const GITHUB_USERNAME = "your-github-username"; // ← change this
const CONTACT_EMAIL = "you@example.com"; // ← change this
const YOUR_NAME = "Your Name"; // optional override; if empty uses GitHub name
const TAGLINE = "طراح گرافیک و طراح تجربه کاربری — می‌سازم، ساده می‌کنم، بهتر می‌کنم"; // edit freely
const CITY = "Tehran, Iran"; // optional; leave "" to hide
const LINKS = [
  { label: "GitHub", href: `https://github.com/${GITHUB_USERNAME}`, icon: Github },
  { label: "رزومه (PDF)", href: "#", icon: Download }, // put a valid link or remove
  { label: "ایمیل", href: `mailto:${CONTACT_EMAIL}`, icon: Mail },
  // { label: "LinkedIn", href: "https://linkedin.com/in/...", icon: LinkIcon },
  // { label: "Website", href: "https://yourdomain.com", icon: LinkIcon },
];

// === Helpers ===
const cn = (...classes) => classes.filter(Boolean).join(" ");
const prettyNumber = (n) => (n >= 1000 ? `${(n / 1000).toFixed(1)}k` : `${n}`);

export default function App() {
  const [isDark, setIsDark] = useState(() => {
    if (typeof window === "undefined") return true;
    return (
      localStorage.getItem("theme") === "dark" ||
      (!("theme" in localStorage) && window.matchMedia("(prefers-color-scheme: dark)").matches)
    );
  });

  useEffect(() => {
    const root = window.document.documentElement;
    root.classList.toggle("dark", isDark);
    localStorage.setItem("theme", isDark ? "dark" : "light");
  }, [isDark]);

  const [user, setUser] = useState(null);
  const [repos, setRepos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    async function load() {
      setLoading(true);
      setError("");
      try {
        const [uRes, rRes] = await Promise.all([
          fetch(`https://api.github.com/users/${GITHUB_USERNAME}`, {
            headers: { Accept: "application/vnd.github+json" },
          }),
          fetch(`https://api.github.com/users/${GITHUB_USERNAME}/repos?per_page=100&sort=updated`, {
            headers: { Accept: "application/vnd.github+json" },
          }),
        ]);

        if (!uRes.ok) throw new Error("مشکل در دریافت پروفایل گیت‌هاب");
        if (!rRes.ok) throw new Error("مشکل در دریافت مخازن گیت‌هاب");

        const userData = await uRes.json();
        const repoData = await rRes.json();

        setUser(userData);
        setRepos(Array.isArray(repoData) ? repoData : []);
      } catch (e) {
        setError(e.message || "خطای نامشخص رخ داد");
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  const totalStars = useMemo(() => repos.reduce((sum, r) => sum + (r.stargazers_count || 0), 0), [repos]);

  const featured = useMemo(() => {
    const filtered = repos
      .filter((r) => !r.fork)
      .map((r) => ({
        id: r.id,
        name: r.name,
        description: r.description,
        url: r.html_url,
        stars: r.stargazers_count || 0,
        forks: r.forks_count || 0,
        lang: r.language,
        updated: r.updated_at,
        homepage: r.homepage,
        topics: r.topics || [],
      }));

    // Sort by stars desc, then by updated desc
    return filtered
      .sort((a, b) => {
        if (b.stars !== a.stars) return b.stars - a.stars;
        return new Date(b.updated) - new Date(a.updated);
      })
      .slice(0, 8);
  }, [repos]);

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 to-white dark:from-slate-950 dark:to-slate-900 text-slate-900 dark:text-slate-100">
      {/* NAV */}
      <header className="sticky top-0 z-50 backdrop-blur supports-[backdrop-filter]:bg-white/50 dark:supports-[backdrop-filter]:bg-slate-900/40 bg-white/70 dark:bg-slate-950/40 border-b border-slate-200/50 dark:border-slate-800/60">
        <div className="mx-auto max-w-6xl px-4 py-3 flex items-center justify-between">
          <a href="#home" className="font-bold tracking-tight text-slate-900 dark:text-white text-lg">{YOUR_NAME || user?.name || GITHUB_USERNAME}</a>
          <nav className="hidden md:flex items-center gap-6 text-sm">
            <a href="#projects" className="hover:opacity-80">پروژه‌ها</a>
            <a href="#about" className="hover:opacity-80">درباره من</a>
            <a href="#contact" className="hover:opacity-80">تماس</a>
            <button
              aria-label="Toggle theme"
              onClick={() => setIsDark((v) => !v)}
              className="rounded-full p-2 border border-slate-200 dark:border-slate-700 hover:bg-slate-100 dark:hover:bg-slate-800"
            >
              {isDark ? <Sun size={18} /> : <Moon size={18} />}
            </button>
          </nav>
        </div>
      </header>

      {/* HERO */}
      <section id="home" className="relative">
        <div className="absolute inset-0 -z-10 overflow-hidden">
          <div className="pointer-events-none absolute -top-40 left-1/2 h-[500px] w-[500px] -translate-x-1/2 rounded-full bg-gradient-to-tr from-indigo-400/30 via-fuchsia-400/20 to-cyan-400/20 blur-3xl dark:from-indigo-500/20 dark:via-fuchsia-500/10 dark:to-cyan-500/10" />
        </div>
        <div className="mx-auto max-w-6xl px-4 py-16 md:py-24">
          <div className="grid md:grid-cols-[160px_1fr] items-center gap-8">
            <motion.img
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5 }}
              src={user?.avatar_url || `https://avatars.githubusercontent.com/${GITHUB_USERNAME}`}
              alt="Avatar"
              className="size-36 rounded-2xl ring-1 ring-slate-200/70 dark:ring-slate-800 object-cover"
            />
            <div>
              <motion.h1
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, delay: 0.05 }}
          className="text-3xl md:text-5xl font-extrabold tracking-tight"
        >
          {YOUR_NAME || user?.name || GITHUB_USERNAME}
        </motion.h1>
              <motion.p
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.5, delay: 0.1 }}
                className="mt-3 text-slate-600 dark:text-slate-300 max-w-2xl"
              >
                {user?.bio || TAGLINE}
              </motion.p>
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.5, delay: 0.15 }}
                className="mt-5 flex flex-wrap items-center gap-3"
              >
                {CITY && (
                  <span className="inline-flex items-center gap-2 rounded-full bg-white/60 dark:bg-slate-900/60 backdrop-blur px-3 py-1.5 text-sm ring-1 ring-slate-200 dark:ring-slate-800">
                    <MapPin size={16} /> {CITY}
                  </span>
                )}
                <a
                  href={`https://github.com/${GITHUB_USERNAME}`}
                  target="_blank"
                  rel="noreferrer"
                  className="inline-flex items-center gap-2 rounded-full bg-white/60 dark:bg-slate-900/60 backdrop-blur px-3 py-1.5 text-sm ring-1 ring-slate-200 dark:ring-slate-800 hover:bg-white/80 dark:hover:bg-slate-900/80"
                >
                  <Github size={16} /> گیت‌هاب
                </a>
                <a
                  href={`mailto:${CONTACT_EMAIL}`}
                  className="inline-flex items-center gap-2 rounded-full bg-white/60 dark:bg-slate-900/60 backdrop-blur px-3 py-1.5 text-sm ring-1 ring-slate-200 dark:ring-slate-800 hover:bg-white/80 dark:hover:bg-slate-900/80"
                >
                  <Mail size={16} /> ایمیل بزن
                </a>
              </motion.div>

              {/* Quick Stats */}
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ duration: 0.5, delay: 0.2 }}
                className="mt-6 grid grid-cols-3 md:inline-grid md:auto-cols-max md:grid-flow-col gap-3"
              >
                <Stat label="Repo ها" value={prettyNumber(user?.public_repos ?? 0)} />
                <Stat label="Stars" value={prettyNumber(totalStars)} />
                <Stat label="Followers" value={prettyNumber(user?.followers ?? 0)} />
              </motion.div>
            </div>
          </div>

          {/* Links Row */}
          {!!LINKS.length && (
            <div className="mt-10 flex flex-wrap gap-3">
              {LINKS.map((item) => (
                <a
                  key={item.label}
                  href={item.href}
                  target={item.href.startsWith("http") ? "_blank" : undefined}
                  rel={item.href.startsWith("http") ? "noreferrer" : undefined}
                  className="group inline-flex items-center gap-2 rounded-xl border border-slate-200 dark:border-slate-800 bg-white/60 dark:bg-slate-900/60 backdrop-blur px-4 py-2 text-sm hover:border-slate-300 dark:hover:border-slate-700 hover:shadow-sm"
                >
                  {item.icon ? <item.icon size={16} /> : <LinkIcon size={16} />}
                  <span>{item.label}</span>
                  <ExternalLink size={14} className="opacity-0 group-hover:opacity-100 transition-opacity" />
                </a>
              ))}
            </div>
          )}
        </div>
      </section>

      {/* PROJECTS */}
      <section id="projects" className="mx-auto max-w-6xl px-4 py-12 md:py-16">
        <div className="flex items-end justify-between gap-4 mb-6">
          <h2 className="text-2xl md:text-3xl font-bold">پروژه‌های منتخب</h2>
          <a
            href={`https://github.com/${GITHUB_USERNAME}?tab=repositories`}
            target="_blank"
            rel="noreferrer"
            className="text-sm hover:underline opacity-80"
          >
            مشاهده همه
          </a>
        </div>

        {loading && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {Array.from({ length: 6 }).map((_, i) => (
              <div key={i} className="h-40 rounded-2xl bg-slate-100/60 dark:bg-slate-800/40 animate-pulse" />
            ))}
          </div>
        )}

        {!loading && error && (
          <div className="p-4 rounded-xl bg-red-500/10 border border-red-500/30 text-red-600 dark:text-red-400">
            {error}
          </div>
        )}

        {!loading && !error && (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            {featured.map((p, idx) => (
              <motion.a
                key={p.id}
                href={p.url}
                target="_blank"
                rel="noreferrer"
                initial={{ opacity: 0, y: 10 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: "-50px" }}
                transition={{ duration: 0.35, delay: idx * 0.03 }}
                className="group relative block rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/70 dark:bg-slate-900/60 backdrop-blur p-5 hover:shadow-xl hover:-translate-y-0.5 transition-all"
              >
                <div className="flex items-start justify-between gap-3">
                  <h3 className="font-semibold tracking-tight text-slate-900 dark:text-white">
                    {p.name}
                  </h3>
                  <div className="flex items-center gap-3 text-xs opacity-90">
                    <span className="inline-flex items-center gap-1"><Star size={14} />{prettyNumber(p.stars)}</span>
                    <span className="inline-flex items-center gap-1"><GitFork size={14} />{prettyNumber(p.forks)}</span>
                  </div>
                </div>
                <p className="mt-2 text-sm text-slate-600 dark:text-slate-300 line-clamp-2 min-h-10">
                  {p.description || "بدون توضیح"}
                </p>
                <div className="mt-3 flex flex-wrap gap-2">
                  {p.lang && (
                    <span className="text-[11px] rounded-full bg-slate-100 dark:bg-slate-800 px-2 py-1 text-slate-700 dark:text-slate-300">
                      {p.lang}
                    </span>
                  )}
                  {p.topics?.slice(0, 3).map((t) => (
                    <span key={t} className="text-[11px] rounded-full bg-slate-100 dark:bg-slate-800 px-2 py-1 text-slate-700 dark:text-slate-300">
                      {t}
                    </span>
                  ))}
                </div>
                <div className="mt-4 flex items-center gap-2 text-sm">
                  <span className="opacity-70">برو به گیت‌هاب</span>
                  <ExternalLink size={14} className="opacity-0 group-hover:opacity-100 transition-opacity" />
                </div>
                {p.homepage && (
                  <a
                    href={p.homepage}
                    onClick={(e) => e.stopPropagation()}
                    target="_blank"
                    rel="noreferrer"
                    className="absolute bottom-5 right-5 text-xs underline opacity-80 hover:opacity-100"
                  >
                    Demo ↗
                  </a>
                )}
              </motion.a>
            ))}
          </div>
        )}
      </section>

      {/* ABOUT */}
      <section id="about" className="mx-auto max-w-6xl px-4 py-12 md:py-16">
        <h2 className="text-2xl md:text-3xl font-bold mb-6">درباره من</h2>
        <div className="grid md:grid-cols-2 gap-6">
          <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/70 dark:bg-slate-900/60 backdrop-blur p-6 leading-8 text-slate-700 dark:text-slate-300">
            <p>
              سلام! من {YOUR_NAME || user?.name || GITHUB_USERNAME} هستم. به طراحی رابط‌های ساده و خوش‌دست، بهینه‌سازی تجربه کاربری، و ساخت ابزارهای کوچک
              اما کارآمد علاقه دارم. همیشه سعی می‌کنم بین زیبایی بصری و عملکرد واقعی تعادل ایجاد کنم.
            </p>
            <p className="mt-4">
              مهارت‌ها: Figma, UX Research, UI Design, Prototyping, HTML/CSS, JavaScript, React, Tailwind, Git
            </p>
          </div>
          <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/70 dark:bg-slate-900/60 backdrop-blur p-6">
            <ul className="space-y-3 text-sm">
              <li className="flex items-center gap-3"><span className="size-2 rounded-full bg-emerald-500" /> همکاری فریلنس با کسب‌وکارهای کوچک</li>
              <li className="flex items-center gap-3"><span className="size-2 rounded-full bg-indigo-500" /> علاقه‌مند به HCI و AI برای تولید UI</li>
              <li className="flex items-center gap-3"><span className="size-2 rounded-full bg-amber-500" /> تمرکز روی دیزاین سیستم و کامپوننت لایبرری</li>
              <li className="flex items-center gap-3"><span className="size-2 rounded-full bg-pink-500" /> تجربه کار با React + Tailwind</li>
            </ul>
          </div>
        </div>
      </section>

      {/* CONTACT */}
      <section id="contact" className="mx-auto max-w-6xl px-4 py-12 md:py-16">
        <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/70 dark:bg-slate-900/60 backdrop-blur p-8 flex flex-col md:flex-row items-center justify-between gap-6">
          <div>
            <h3 className="text-xl md:text-2xl font-bold">با هم کار کنیم؟</h3>
            <p className="mt-2 text-slate-600 dark:text-slate-300">برای همکاری، پروژه‌ی جدید، یا گپ دوستانه ایمیل بزن.</p>
          </div>
          <div className="flex items-center gap-3">
            <a
              href={`mailto:${CONTACT_EMAIL}`}
              className="inline-flex items-center gap-2 rounded-xl border border-slate-200 dark:border-slate-700 bg-slate-900 text-white dark:bg-white dark:text-slate-900 px-5 py-3 text-sm hover:opacity-90"
            >
              <Mail size={16} /> ایمیل
            </a>
            <a
              href={`https://github.com/${GITHUB_USERNAME}`}
              target="_blank"
              rel="noreferrer"
              className="inline-flex items-center gap-2 rounded-xl border border-slate-200 dark:border-slate-700 px-5 py-3 text-sm hover:bg-slate-100 dark:hover:bg-slate-800"
            >
              <Github size={16} /> GitHub
            </a>
          </div>
        </div>
      </section>

      <footer className="py-10 text-center text-xs opacity-70">
        ساخته‌شده با React و Tailwind — © {new Date().getFullYear()} {YOUR_NAME || user?.name || GITHUB_USERNAME}
      </footer>
    </div>
  );
}

function Stat({ label, value }) {
  return (
    <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-white/70 dark:bg-slate-900/60 backdrop-blur px-4 py-2">
      <div className="text-xs opacity-70">{label}</div>
      <div className="text-lg font-semibold">{value}</div>
    </div>
  );
}
