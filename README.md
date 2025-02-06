# AI Cold Email Writer 📧

This is a **Rails 8+** application that generates cold emails using AI.
It provides a simple UI to draft, refine, and manage emails.

## 📦 Requirements
- Docker 🐳
- Dev Containers (Optional)
- Ruby on Rails (bundled with the container)
- PostgreSQL (bundled with the container)
- OpenAI API Key 🔑

---

## 🔧 Setup Instructions

### **⬇️ Clone the Repository**
```sh
git clone https://github.com/a-bachelet/hunter-technical-test.git
cd hunter-technical-test
```

### **⚙️ Configure Environment Variables**
Copy the sample file :
```sh
cp .env.sample .env
```

Update your OpenAI API Key :
```sh
OPEN_AI_KEY="your-api-key-here"
```

### **🏗️ Start the Application**
```sh
cd .devcontainer
docker compose up -d
docker compose exec rails-app bash
cd workspaces/hunter-technical-test
bundle
bin/rails db:migrate
bin/rails s -b 0.0.0.0
```

### **🎉 Enjoy !**
Go to http://0.0.0.0:3000 and enjoy the application
