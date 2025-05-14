import fs from 'node:fs/promises'

const TZ_PAR = 'America/Asuncion'
const offsetH = Number(process.env.OFFSET_H || 0) // -1, -2, …

const nowPar = new Date()

// hora Paraguay → sumar desfase → hora server
const serverMs = nowPar.getTime() + offsetH * 3_600_000
const serverDate = new Date(serverMs)

// strings server-time
const hhmm = serverDate.toISOString().slice(11, 16).replace(':', '-') // '18-20'
const day = serverDate.toLocaleDateString('en-US',
    { weekday: 'short', timeZone: 'UTC' }).toLowerCase().slice(0, 3) // 'mon'

try {
    const txt = await fs.readFile(
        new URL(`../mensajes/${day}-${hhmm}.md`, import.meta.url), 'utf8'
    )
    await fetch(process.env.DISCORD_WEBHOOK, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ content: txt.trim() })
    })
} catch { /* sin mensaje */ }
