import fs from 'node:fs/promises'

const offsetH = Number(process.env.OFFSET_H || 0)
const parNow = new Date()
const srvDate = new Date(parNow.getTime() + offsetH * 3_600_000)

const hh = String(srvDate.getHours()).padStart(2, '0')
const mm = String(srvDate.getMinutes()).padStart(2, '0')
const dow = srvDate.toLocaleDateString('en-US',
    { weekday: 'short', timeZone: 'UTC' })
    .slice(0, 3).toLowerCase()
const dd = String(srvDate.getDate()).padStart(2, '0')

const dir = new URL('../mensajes/', import.meta.url)
for (const name of [`\${dow}-\${hh}-\${mm}.md`, `\${dd}-\${hh}-\${mm}.md`]) {
    try {
        const txt = await fs.readFile(new URL(name, dir), 'utf8')
        await fetch(process.env.DISCORD_WEBHOOK, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ content: txt.trim() })
        })
        break
    } catch { }
}
