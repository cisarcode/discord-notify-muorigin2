// /scripts/send.js
import fs from 'node:fs/promises'

const TZ = 'America/Asuncion'
const now = new Intl.DateTimeFormat('en-GB', {
    hour: '2-digit',
    minute: '2-digit',
    hour12: false,
    timeZone: TZ
}).format(new Date()) // "18:30"

const hook = process.env.DISCORD_WEBHOOK
if (!hook) throw new Error('DISCORD_WEBHOOK missing')

try {
    const file = new URL(`../mensajes/${now.replace(':', '-')}.md`, import.meta.url)
    const content = await fs.readFile(file, 'utf8')

    await fetch(hook, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ content: content.trim() })
    })
} catch {
    process.exit(0) // sin mensaje → salida limpia
}
