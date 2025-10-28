// app/javascript/controllers/journal_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="journal"
export default class extends Controller {
  static targets = ["form", "note", "photo", "entries"]

  connect() {
    this.plantId = this.element.dataset.plantId
    this.storageKey = `plant_journal_${this.plantId}`
    this.renderEntries()
  }

  loadEntries() {
    return JSON.parse(localStorage.getItem(this.storageKey)) || []
  }

  saveEntries(entries) {
    localStorage.setItem(this.storageKey, JSON.stringify(entries))
  }

  renderEntries() {
    const entries = this.loadEntries().sort((a, b) => new Date(b.date) - new Date(a.date))
    this.entriesTarget.innerHTML = ""

    entries.forEach((entry, index) => {
      const div = document.createElement("div")
      div.className = "border rounded p-3 my-2 bg-green-50 flex flex-col gap-2"

      div.innerHTML = `
        <div class="text-sm text-gray-600">${new Date(entry.date).toLocaleString()}</div>
        <div>${entry.note}</div>
        ${entry.photo ? `<img src="${entry.photo}" class="max-h-48 rounded" />` : ""}
        <div class="flex gap-2 mt-2">
          <button data-action="click->journal#editEntry" data-index="${index}" class="bg-yellow-200 px-2 py-1 rounded text-xs">Edit</button>
          <button data-action="click->journal#deleteEntry" data-index="${index}" class="bg-red-200 px-2 py-1 rounded text-xs">Delete</button>
        </div>
      `
      this.entriesTarget.appendChild(div)
    })
  }

  addEntry(event) {
    event.preventDefault()
    const note = this.noteTarget.value
    const file = this.photoTarget.files[0]
    const reader = new FileReader()

    const save = (photoData) => {
      const entries = this.loadEntries()
      entries.push({ date: new Date(), note, photo: photoData })
      this.saveEntries(entries)
      this.renderEntries()
      this.formTarget.reset()
    }

    if (file) {
      reader.onload = () => save(reader.result)
      reader.readAsDataURL(file)
    } else {
      save(null)
    }
  }

  deleteEntry(event) {
    const index = event.target.dataset.index
    const entries = this.loadEntries()
    entries.splice(index, 1)
    this.saveEntries(entries)
    this.renderEntries()
  }

  editEntry(event) {
    const index = event.target.dataset.index
    const entries = this.loadEntries()
    const entry = entries[index]
    this.noteTarget.value = entry.note
    entries.splice(index, 1)
    this.saveEntries(entries)
    this.renderEntries()
  }
}
