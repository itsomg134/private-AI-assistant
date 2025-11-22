# Private Ai Assistancts

### A fully local, real-time voice AI assistant powered by Livekit, Ollama, and the fast, open-source Kokoro TTS engine.

> Privacy-first conversational AI that runs entirely on your machine. No cloud, no subscriptions, no data leaks.

[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Open Source](https://img.shields.io/badge/Open%20Source-%E2%9D%A4-red)](https://github.com/yourusername/local-voice-ai)

---

## 🎥 Demo Video

https://github.com/user-attachments/assets/your-video-id-here.mp4

*Watch Local Voice AI in action: Real-time voice conversations with sub-second latency*

> **📹 To add your demo:** Upload your video directly to GitHub (drag & drop in issues/PRs) or link to YouTube using the format below:

```markdown
[![Local Voice AI Demo](https://img.youtube.com/vi/YOUR_VIDEO_ID/maxresdefault.jpg)](https://www.youtube.com/watch?v=YOUR_VIDEO_ID)
```
<img width="1920" height="1080" alt="Screenshot (123)" src="https://github.com/user-attachments/assets/0c6f7877-2709-4f63-a3d6-8392e2f0e7f0" />

---

## 🎯 Overview

**Local Voice AI** is a state-of-the-art, multimodal AI application designed for low-latency, entirely offline operation. It leverages the power of open-source models and frameworks to create a high-performance voice assistant that runs securely within a Dockerized environment.

This project orchestrates the complete voice-to-voice pipeline: capturing user speech, processing it with a local Large Language Model (LLM), and synthesizing the response back to the user in real-time.

<img width="1920" height="1080" alt="Screenshot (125)" src="https://github.com/user-attachments/assets/d63d3484-97fa-4b5d-8971-fbe7355bb348" />

## ✨ Key Features

- **⚡ Ultra-Low Latency** - Designed for a real-time conversational experience by utilizing the **Livekit Agents** framework for efficient pipeline orchestration
- **🧠 Local Intelligence (LLM)** - Integrates **Ollama** to host and manage private, open-source LLMs (like Llama 3 or Mistral) for secure, on-device reasoning
- **🎙️ Local Speech-to-Text (STT)** - High-accuracy, offline transcription using **Whisper**
- **🔊 Fast Text-to-Speech (TTS)** - Uses **Kokoro TTS** (an 82M parameter model) for ultra-fast, natural-sounding voice synthesis that streams mid-sentence
- **🌐 WebRTC Connectivity** - **Livekit** provides the real-time media server foundation for stable, low-latency audio streaming between the browser frontend and the AI backend services
- **🐳 Dockerized Setup** - Easy, reproducible deployment of the entire stack (STT, LLM, TTS, Agent, Frontend) using **Docker Compose**
- **🔒 Privacy First** - Everything runs locally. Your conversations never leave your machine
- **🛠️ Extensible** - Easy to customize with new tools, models, and capabilities

## 🏗️ Architecture & Services

The project is structured around a microservices architecture, orchestrated by Docker Compose:

| Service | Role | Technology / Port | Details |
|---------|------|-------------------|---------|
| **ollama** | Large Language Model | Local API (`11434`) | Runs models for AI reasoning and response generation |
| **whisper** | Speech-to-Text | Agent Dependency | Transcribes live audio streams from the user |
| **kokoro** | Text-to-Speech | API (`8888`) | Generates natural, low-latency audio output from the LLM's text response |
| **livekit** | Media Server | WebRTC (`7880`, `7881`) | Handles real-time communication and audio routing |
| **agent** | Orchestrator/Logic | Python/FastAPI | The "brain," coordinating the STT, LLM, and TTS services |
| **frontend** | User Interface | Web (`3000` or `8889`) | Provides the browser-based interface for conversation |

### 🔄 Data Flow

```
User Voice → Livekit → Whisper (STT) → Ollama (LLM) → Kokoro (TTS) → Livekit → User Audio
```

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose installed
- At least 8GB RAM (16GB recommended for larger models)
- Modern web browser with WebRTC support

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/itsomg134/private-Ai-assistant.git
   cd private-Ai-assistant
   ```

2. **Run the full stack with Docker Compose:**
   ```bash
   docker-compose up --build
   ```
   *The `--build` command ensures all custom images, like the `kokoro` and `agent` services, are correctly compiled.*

3. **Access the Application:**
   Allow a moment for all services to start and the Ollama model to load.
   
   - **Open the Web Frontend:** [http://localhost:3000](http://localhost:3000) or [http://localhost:8889/web/](http://localhost:8889/web/)

4. **Start Talking!**
   Interact with your fully local, multimodal AI assistant.

## 🧪 Development & Extension

### Custom Tools

Extend the functionality by adding new methods and logic within the `agent` service. The **EGG ANALYZER** is a template for integrating domain-specific tools.

<img width="1920" height="1080" alt="Screenshot (126)" src="https://github.com/user-attachments/assets/bce40296-2ff1-45b1-9dc3-95ca521d7f96" />

```python
# Example: Add a custom tool
@agent.tool
async def analyze_weather(location: str):
    """Analyze weather for a given location"""
    # Your custom logic here
    pass
```

### Model Swap

Easily change the LLM by updating the `ollama` configuration in `docker-compose.yml`:

```yaml
ollama:
  environment:
    - OLLAMA_MODEL=llama3:8b  # Change to mixtral, codellama, etc.
```

### API Testing

The `kokoro` and `agent` services expose an OpenAPI documentation page (Swagger UI) at their respective ports for easy testing:

- Kokoro TTS API: `http://localhost:8888/docs`
- Agent API: Check your configured port

## 📊 Performance Benchmarks

- **Response Latency:** < 1 second for typical queries
- **TTS Speed:** 82M parameters, streaming audio mid-sentence
- **Resource Usage:** ~4-8GB RAM depending on model size
- **Throughput:** Real-time audio processing with minimal buffering

## 🛠️ Tech Stack

- **Frontend:** Web (React/Vue/HTML5)
- **Backend:** Python, FastAPI
- **AI/ML:** Ollama, Whisper, Kokoro TTS
- **Real-Time:** Livekit (WebRTC)
- **Containerization:** Docker, Docker Compose
- **Architecture:** Microservices

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
   

## 📋 Demo video Please see our https://drive.google.com/file/d/1Pr_5vPJ2ujUc96Uwd9JGI849EvYMT-Pw/view?usp=sharing

## 📋 Roadmap

- [ ] Multi-language support
- [ ] Voice cloning capabilities
- [ ] Mobile app (iOS/Android)
- [ ] Multi-user support
- [ ] Plugin system for custom integrations
- [ ] GPU acceleration optimization
- [ ] Model fine-tuning tools

## 🐛 Troubleshooting

**Services won't start:**
- Ensure Docker has sufficient memory allocated (8GB+)
- Check port conflicts (3000, 7880, 7881, 8888, 11434)

**Audio quality issues:**
- Verify microphone permissions in browser
- Check network conditions (even for local WebRTC)

**Slow responses:**
- Consider using a smaller model (e.g., llama3:3b)
- Ensure GPU drivers are properly configured if using GPU acceleration


## 🙏 Acknowledgments

- [Livekit](https://livekit.io/) for the real-time communication infrastructure
- [Ollama](https://ollama.ai/) for making LLMs accessible locally
- [Kokoro TTS](https://github.com/hexgrad/kokoro) for fast, natural speech synthesis
- [OpenAI Whisper](https://github.com/openai/whisper) for accurate speech recognition

## 📞 Support


- GitHub: [@itsomg134](https://github.com/itsomg134)
- Twitter: [@omgedam](https://x.com/its_om_g_143?t=8I7F1GBJO6jLU1AaoQLgYQ&s=09)
- Email: omgedam123098@gmail.com
- Portfolio: [ogworks.lovable.app](https://ogworks.lovable.app)  
- LinkedIn: [Om Gedam](https://www.linkedin.com/in/om-gedam-39686432a)


## 🏷️ Tags

`#VoiceAI` `#Livekit` `#Ollama` `#KokoroTTS` `#Whisper` `#Docker` `#RealTime` `#LocalAI` `#FastAPI` `#Multimodal` `#PrivacyFirst` `#OpenSource` `#WebRTC` `#SpeechToText` `#TextToSpeech`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
