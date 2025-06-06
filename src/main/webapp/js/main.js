
const sidebar = document.getElementById("sidebar")
const sidebarToggle = document.getElementById("sidebarToggle")
const mainContent = document.getElementById("mainContent")

document.addEventListener("DOMContentLoaded", () => {
  initializeSidebar()
  initializeForms()
  setMinDate()
  initializeFilters()
})

function initializeSidebar() {
  if (sidebarToggle) {
    sidebarToggle.addEventListener("click", toggleSidebar)
  }

  document.addEventListener("click", (event) => {
    if (window.innerWidth <= 768) {
      if (!sidebar.contains(event.target) && !sidebarToggle.contains(event.target)) {
        closeSidebar()
      }
    }
  })

  window.addEventListener("resize", () => {
    if (window.innerWidth > 768) {
      sidebar.classList.remove("show")
      mainContent.classList.remove("expanded")
    }
  })
}

function toggleSidebar() {
  if (window.innerWidth <= 768) {
    sidebar.classList.toggle("show")
  } else {
    sidebar.classList.toggle("collapsed")
    mainContent.classList.toggle("expanded")
  }
}

function closeSidebar() {
  sidebar.classList.remove("show")
}

// Form initialization and validation
function initializeForms() {
  const appointmentForm = document.getElementById("appointmentForm")
  if (appointmentForm) {
    
    const appointmentDate = document.getElementById("appointmentDate")
    const timeSlot = document.getElementById("timeSlot")

    if (appointmentDate) appointmentDate.addEventListener("change", updateAppointmentSummary)
    if (timeSlot) timeSlot.addEventListener("change", updateAppointmentSummary)
  }
}

function setMinDate() {
  const appointmentDate = document.getElementById("appointmentDate")
  if (appointmentDate) {
    const today = new Date()
    const tomorrow = new Date(today)
    tomorrow.setDate(tomorrow.getDate() + 1)
    appointmentDate.min = tomorrow.toISOString().split("T")[0]
  }
}


function selectType(type) {
  document.querySelectorAll(".type-option").forEach((option) => {
    option.classList.remove("selected")
  })

  event.currentTarget.classList.add("selected")

  document.getElementById(`type${type.charAt(0).toUpperCase() + type.slice(1)}`).checked = true

  updateAppointmentSummary()
}

function updateAppointmentSummary() {
  const appointmentType = document.querySelector('input[name="appointmentType"]:checked')
  const appointmentDate = document.getElementById("appointmentDate")
  const timeSlot = document.getElementById("timeSlot")
  const summaryDiv = document.getElementById("appointmentSummary")

  if (appointmentType && appointmentDate.value && timeSlot.value) {
    const typeText = appointmentType.value === "home" ? "Home Collection" : "At Center"
    const dateText = new Date(appointmentDate.value).toLocaleDateString("en-US", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    })

    summaryDiv.innerHTML = `
            <p><strong>Type:</strong> ${typeText}</p>
            <p><strong>Date:</strong> ${dateText}</p>
            <p><strong>Time:</strong> ${timeSlot.value.replace("-", " - ")}</p>
        `
  } else {
    summaryDiv.innerHTML = '<p class="text-muted">Please select appointment details above to see the summary.</p>'
  }
}



function initializeFilters() {
  const statusFilter = document.getElementById("statusFilter")
  if (statusFilter) {
    statusFilter.addEventListener("change", filterDonations)
  }
}

function filterDonations() {
  const statusFilter = document.getElementById("statusFilter")
  const table = document.getElementById("donationsTable")
  const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr")
  const emptyState = document.getElementById("emptyState")

  let visibleRows = 0
  const filterValue = statusFilter.value.toLowerCase()

  for (const row of rows) {
    const statusCell = row.cells[3]
    const statusText = statusCell.textContent.toLowerCase()

    if (filterValue === "" || statusText.includes(filterValue)) {
      row.style.display = ""
      visibleRows++
    } else {
      row.style.display = "none"
    }
  }
}

function showToast(message, type = "success") {
 
  const existingToast = document.querySelector(".toast")
  if (existingToast) {
    existingToast.remove()
  }

 
  const toast = document.createElement("div")
  toast.className = `toast ${type === "error" ? "error" : ""}`
  toast.textContent = message

  document.body.appendChild(toast)

  // Show toast
  setTimeout(() => {
    toast.classList.add("show")
  }, 100)

  // Hide toast after 3 seconds
  setTimeout(() => {
    toast.classList.remove("show")
    setTimeout(() => {
      toast.remove()
    }, 300)
  }, 3000)
}

function logout() {
  if (confirm("Are you sure you want to logout?")) {
    showToast("Logging out...", "success")
    setTimeout(() => {
      window.location.href = "index.jsp"
    }, 1000)
  }
}

function formatDate(dateString) {
  return new Date(dateString).toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  })
}

function formatTime(timeString) {
  return timeString.replace("-", " - ")
}



window.DonorModule = {
  showToast,
  logout,
  selectType,
  toggleSidebar,
}
