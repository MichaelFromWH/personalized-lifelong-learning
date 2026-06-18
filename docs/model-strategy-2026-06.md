# Model Strategy For Life Vision Board

Date: 2026-06-16

This note summarizes open-weight / open-source model candidates for the Life Vision Board product. It focuses on a future independent Web/App version, not only the current Codex Skill package.

## First Correction: "GLM M3" Is Probably Not The Right Name

I did not find a primary source for a model called `GLM M3`.

The likely matches are:

- `MiniMax-M3`: a native multimodal model with 1M context, about 428B total parameters and 23B active parameters. Official Hugging Face and GitHub pages exist.
- `BGE-M3`: an embedding model for retrieval, supporting dense retrieval, lexical matching, and multi-vector interaction. It is not a chat or coaching model.
- `GLM`: the Z.ai / Zhipu family currently has GLM-4.5, GLM-4.7, GLM-5, GLM-V, GLM-OCR, etc.

## Product Requirements

The model stack needs to support:

- Chinese-first goal-support conversations.
- Goal clarification and coaching style adaptation.
- Long-term user memory and RAG over goal history.
- Plan generation and review adjustment.
- Multimodal input for screenshots, notes, whiteboards, books, and user artifacts.
- Low-cost repeated coaching sessions.
- Optional local/private deployment.

## Recommended Stack

### 1. Main Cloud / Server LLM

Use a strong Chinese-capable, agentic model as the main planner and coach.

Recommended candidates:

- `Qwen3 / Qwen3.5 / Qwen3.6 family`: strong Chinese, multilingual, tool-use ecosystem, and broad deployment support.
- `GLM-5.2`: strong current evaluation candidate from Z.ai for long-horizon coding and agentic workflows. Official Hugging Face materials describe 1M context, MIT open-source licensing, public weights, and local serving support through frameworks such as Transformers, vLLM, SGLang, xLLM, and ktransformers.
- `DeepSeek-V4 Preview`: strong current evaluation candidate from DeepSeek, with official API release notes and public Hugging Face model cards for Pro / Flash variants. Its 1M context makes it relevant for long goal histories and review synthesis.
- `MiniMax-M3`: attractive if the product needs native multimodal goal-support sessions and long context. Very new, so validate deployment maturity before betting the product on it.
- `Kimi K2.6 / Kimi K2.7 Code`: strong for long-horizon agentic workflows and coding-heavy goal paths; less obviously the default for broad everyday goals.
- `DeepSeek-V3.2`: strong reasoning and agent performance, but large deployment footprint.

Practical recommendation:

- Start with `Qwen` as the stable open-stack baseline because it is broad, Chinese-friendly, and easier to deploy.
- Add `GLM-5.2` and `DeepSeek-V4 Preview` as live evaluation tracks before declaring a default.
- Keep `MiniMax-M3` as a multimodal / long-context evaluation track.
- Use hosted APIs during early product validation; move to self-hosting only after usage patterns are clear.

### 2. Multimodal Understanding

Use multimodal models for:

- notes and screenshots
- milestone route images
- whiteboard photos
- book pages
- future assignment/homework screenshots

Recommended candidates:

- `Qwen3-VL`: strong general vision-language direction, especially if the main text model is also Qwen.
- `MiniMax-M3`: native multimodality plus long context, promising for rich goal-support sessions.
- `MiniCPM-V`: good edge-deployment direction, useful if the mobile app eventually wants local or low-cost visual understanding.
- `GLM-V / GLM-OCR`: useful evaluation track for Chinese OCR and visual understanding.

Practical recommendation:

- Use `Qwen3-VL` first for server-side visual understanding.
- Evaluate `MiniCPM-V` for on-device/mobile lightweight use.

### 3. Retrieval / Memory

Life Vision Board needs durable memory. Do not rely only on the chat model context.

Recommended components:

- Embedding: `BGE-M3` as a strong multilingual default for hybrid retrieval.
- Alternative embedding/reranking: Qwen embedding/reranker family, especially if the rest of the stack uses Qwen.
- Vector database: start with Postgres + pgvector for simplicity; later evaluate Milvus/Qdrant if retrieval complexity grows.

Practical recommendation:

- Use structured memory tables for goal contracts, user profile, goal state, and stage plans.
- Use `BGE-M3` or Qwen embeddings for unstructured notes, transcripts, resources, and user artifacts.
- Add reranking once retrieval starts returning noisy context.

### 4. Edge / Mobile Model

The first Web/App product does not need full local LLM inference. But mobile-local models can support:

- offline reflection prompts
- lightweight summarization
- draft feedback
- privacy-sensitive journaling
- local OCR/vision pre-processing

Recommended candidates:

- `MiniCPM` small models for on-device exploration.
- Small Qwen models for local assistant features.
- MiniCPM-V variants for compact vision-language use.

Practical recommendation:

- Do not start with local inference as a product dependency.
- Build the architecture so local models can be plugged in later.

## Suggested Model Architecture

```text
Client Web/App
  -> Life Vision Board Orchestrator API
    -> Main LLM Router
       -> Qwen default planner/coach
       -> GLM / MiniMax / Kimi / DeepSeek evaluation routes
    -> Vision Router
       -> Qwen3-VL or MiniMax-M3
    -> Memory Service
       -> Postgres structured state
       -> pgvector + BGE-M3 embeddings
    -> Evaluation Service
       -> transcript rubric scoring
       -> weekly review scoring
```

## Source Links

- GLM-5.2 Hugging Face blog: https://huggingface.co/blog/zai-org/glm-52-blog
- GLM-5.2 FP8 Hugging Face: https://huggingface.co/zai-org/GLM-5.2-FP8
- DeepSeek V4 Preview release: https://api-docs.deepseek.com/news/news260424
- DeepSeek-V4-Pro Hugging Face: https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro
- GLM-4.5 GitHub: https://github.com/zai-org/GLM-4.5
- GLM-5 Hugging Face: https://huggingface.co/zai-org/GLM-5
- Z.ai Hugging Face organization: https://huggingface.co/zai-org
- Qwen3 GitHub: https://github.com/QwenLM/Qwen3
- Qwen3.6 GitHub: https://github.com/QwenLM/Qwen3.6
- Qwen organization: https://huggingface.co/Qwen
- Qwen3-VL GitHub: https://github.com/QwenLM/Qwen3-VL
- MiniMax-M3 Hugging Face: https://huggingface.co/MiniMaxAI/MiniMax-M3
- MiniMax-M3 GitHub: https://github.com/MiniMax-AI/MiniMax-M3
- Kimi K2 GitHub: https://github.com/moonshotai/kimi-k2
- Kimi K2.6 Hugging Face: https://huggingface.co/moonshotai/Kimi-K2.6
- Kimi K2.7 Code Hugging Face: https://huggingface.co/moonshotai/Kimi-K2.7-Code
- DeepSeek-V3 GitHub: https://github.com/deepseek-ai/deepseek-v3
- DeepSeek-V3.2 release: https://api-docs.deepseek.com/news/news251201
- BGE-M3 Hugging Face: https://huggingface.co/BAAI/bge-m3
- BGE-M3 docs: https://bge-model.com/bge/bge_m3.html
- FlagEmbedding GitHub: https://github.com/FlagOpen/FlagEmbedding
- MiniCPM-V GitHub: https://github.com/OpenBMB/MiniCPM-V
- MiniCPM-V 4.6 Hugging Face: https://huggingface.co/openbmb/MiniCPM-V-4.6
