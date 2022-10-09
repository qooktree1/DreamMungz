# 최종 README

Status: 발표 및 문서

# 🐶**드림멍즈- NFT 기반 게임 플랫폼**

![Logo](/image/Logo.png)

## **[드림멍즈** 링크](https://j7a605.p.ssafy.io/)

## **[UCC 링크 - 소개 영상 보기](https://www.youtube.com/watch?v=eVtlH42FHsQ)**

---

## 📖 주제

아기 강아지가 세상을 경험하면서 성장하는 이야기를 담은 **NFT** 기반의 **텍스트 어드벤처 게임**

---

## 📅 **프로젝트 진행 기간**

2022.08.29(월) ~ 2022.10.07(금) [****39****일간 진행] - SSAFY 7기 2학기 특화프로젝트

---

## 🤔 기획 배경

- **NFT의 가치**
  - Non-fungible token, 대체 불가능한 토큰으로 대체 가능 토큰(FT) 와 다르게 개별 토큰의 가치가 상이하기 때문에 소유자를 명시할 수 있습니다.
  - 주로 소유권이나 진위를 증명하는 데 주로 쓰이기 때문에 게임 아이템을 생각했습니다.
  - 게임 아이템에 등급(Normal, Epic, ..)과 직업, 능력치 등 다양한 특징을 부여하고 높은 등급 및 직업에 가져야 하는 능력치들의 한계를 설정하여 확률을 나누어 가치를 부여했습니다.
- **사용성**
  - 발급된 NFT를 플랫폼 내부에서 활발히 사용할 수 있는 방법으로 **텍스트 어드벤처 게임**을 적용했습니다.
  - 스토리를 읽고 선택지를 클릭하여 게임 주인공을 육성하며 다양한 NFT를 발행하고 그 NFT를 다시 재사용하여 주인공을 육성할 수 있는 시스템을 적용했습니다.
- **활용성**
  - 게임을 시작할 때 육성하는 주인공의 스탯을 발행된 NFT로 향상시킬 수 있는 시스템을 적용하여 NFT가 단순히 예쁜 이미지가 아닌 게임에서 필수적인 요소로 적용할 수 있게 노력했습니다.

---

## 🎲 게임 진행 방식

1. 재화(MUNG)를 지불해서 아기 강아지를 생성합니다.
2. 게임을 진행하며 선택지를 통해 아기 강아지를 육성합니다.
3. 게임을 끝내면 육성한 결과를 NFT로 발행합니다.
4. 발행된 NFT는 유전 요소가 있기 때문에 다양한 엔딩을 보기 위해 반복적으로 사용 가능합니다.

---

## 🥌 게임 특징

- **스토리**

  - 세계관
    - 주제: 아기 강아지가 세상을 경험하면서 성장하는 이야기
    - 시작 스토리: 산신견을 만나기 위해 여행을 떠난다.
    - 엔딩 스토리: 산신견을 만나 직업을 부여받는다.
  - 총 65개의 스토리와 540개의 선택지가 있습니다.
  - 실제 게임에서는 랜덤으로 선택된 10개의 스토리가 나옵니다.

- **삽화**

  - 텍스트 어드벤처 기반의 게임 특성상 글이 많기 때문에 플레이어가 지루함을 느낄 수 있는 부분을 각각의 스토리마다 그린 삽화로 상황을 간단히 전달할 수 있게 표현했습니다.
  - 각 스토리마다 삽화가 있습니다.

- **NFT**

  - 귀여운 강아지를 바탕으로 속성들을 부여하여 NFT를 발행할 수 있게 설계했습니다.
  - 속성
    - 28가지 직업
    - 2가지 모질
    - 5가지 등급
    - 2가지 성별
    - 12가지 강아지 색상
    - 10가지 얼굴장식
    - 10가지 능력치

- 테마곡
  - 직접 작곡한 테마곡으로 상황에 맞게 적용하였습니다.
  - 메인 페이지, 게임 스토리, 게임 엔딩 등

---

## 📝 **주요 기능**

- **회원 관리**

  - 메타마스크 로그인: Web3.js를 사용하여 메타마스크 로그인 구현
  - 닉네임 수정 기능

- **게임 컨텐츠**

  - 게임 스토리
    - 게임에 등장하는 모든 스토리들의 제목을 보여줍니다.
    - 단편, 중편, 장편으로 구성되어 있습니다.
  - 게임 삽화
    - 스토리마다 제공되는 삽화를 보여줍니다.

- **게임**

  - 게임을 시작하기 전 플랫폼 자체 코인을 지급하여 게임을 시작합니다.
    - 아기 강아지 모드
      - 모든 스탯이 0으로 시작하며 100 MUNG(자체 코인)을 소모
    - 웨딩 모드
      - 남자 와 여자 강아지 NFT를 조합하여 합쳐진 능력치를 가지고 게임을 시작하며 아기 강아지 모드보다 더 많은 코인을 소모
  - 게임 스토리를 읽어나가며 선택지를 고르며 10가지의 다양한 스탯을 얻고 잃을 수 있습니다.
    - 10개의 스토리를 진행하게 됩니다.
    - 총 65개의 다양한 스토리와 540개의 선택지가 존재해 여러가지 방법으로 강아지 캐릭터를 육성할 수 있습니다.
    - 각 메인스토리마다 삽화와 bgm이 있습니다.
  - 게임이 끝난 후 NFT를 민팅할 수 있으며 이제까지 플레이한 스토리들을 삽화와 함께 볼 수 있는 엔딩 크레딧이 있습니다.

- **NFT 목록 페이지**

  - 전체 NFT 목록을 볼 수 있습니다.
  - 필터를 이용하여 필요한 정보들을 찾을 수 있습니다.
    - 판매중, 정보 보기, 이미지만 보기
    - 직업, 모질, 티어, 성별, 강아지 색상, 얼굴장식, 능력치

- **NFT 거래**

  - 구매
    - 즉시 구매
      - 판매자가 등록한 즉시 구매 가격으로 구매가 가능합니다.
    - 가격 제안
      - 가격을 제안할 때 MUNG 토큰을 사용합니다.
      - 구매자가 마음에 드는 제안자를 채택하면 그 제안자가 NFT의 주인이 됩니다.
      - 제안했었던 NFT가 다른 사람에게 판매 완료되면 환불 받을 수 있습니다.
  - 판매
    - 즉시구매 가격과 가격 제안 여부를 설정할 수 있습니다.

- **튜토리얼**

  - 로그인, 게임, 거래 튜토리얼을 제공하여 플랫폼을 이용 시 필요한 정보들을 제공합니다.

- **마이페이지**
  - **보유 NFT**
    - 본인이 보유한 NFT들을 볼 수 있습니다.
    - 판매중, 전체 보기, 능력치 보기, 이미지만 보기 등 필터를 이용할 수 있습니다.
  - **업적**
    - 현재까지 달성한 직업과 직업의 최고 등급이 나타납니다.
    - 미 달성 직업은 자물쇠로 잠겨있습니다.
  - **박물관**
    - Web3.js 사용
    - 3D NFT 전시관을 이용할 수 있으며 가장 등급이 높은 6개의 NFT가 액자에 걸려있습니다.
    - 본인 뿐만 아니라 다양한 사람들이 구경할 수 있습니다.
  - **거래 내역**

    - 본인이 현재까지 거래한 거래한 내역을 확인할 수 있습니다.
    - NFT, 거래 종류(구매, 판매), 판매된 가격, 거래자, 거래 날짜 등 다양한 정보를 확인할 수 있습니다.

  - **제안 내역**
    - 본인이 현재까지 제안한 내역을 확인할 수 있습니다.
    - NFT, 제안 상태(취소 가능, 환불 가능, 환불 완료, 채택됨), 가격, 거래자, 제안 날짜 등 다양한 정보를 확인 할 수 있습니다.
    - 제안했던 NFT가 다른 이용자에게 판매된 경우 환불을 받을 수 있습니다.

---

## ⌨️ **주요 기술**

**Backend**

- IntelliJ IDE 2022.1.3(Ultimate Edition) 11.0.15 + 10-b2043.56 amd64
- Spring Security
- Query DSL
- Web3j
- Hibernate
- JWT
- SpringBoot

**Frontend**

- Node.js
- React 18.2.0
- Recoil 0.7.5
- Three.js 0.144.0
- Tailwind CSS
- Web3.js 1.8.0
- React Query 4.3.9

**Tech**

- MetaMask
- Ropsten Testnet
- SSAFY Network
- Truffle
- Ganache

**CI/CD**

- AWS EC2 Ubuntu 20.04 LTS
- Jenkins 2.346.2
- NGINX 1.23.1
- SSL 인증서
- MySQL
- IPFS Node

---

## 🔧 **협업 툴**

- GitLab
- Notion
- JIRA
- MatterMost
- Webex
- Discord

---

## 🏗️ **프로젝트 파일 구조**

### **Back**

```markdown

```

### Front

```markdown

```

---

## 👥 **팀원 역할 분배**

### BackEnd

### 👩🏻‍💻 신슬기 - 백엔드 팀장

### 👨🏻‍💻 황승주 - 블록체인

### 👨🏻‍💻 박희조 - API, UCC

### FrontEnd

### 👩🏻‍💻 안지영 - 프론트 팀장

### 👩🏻‍💻 채송지 - Design

### 👨🏻‍💻 박종민 - 블록체인

---

## **✔ 프로젝트 산출물**

[포팅매뉴얼](https://github.com/qooktree1/DreamMungz/blob/main/exec/%ED%8F%AC%ED%8C%85%EB%A7%A4%EB%89%B4%EC%96%BC_%EB%93%9C%EB%A6%BC%EB%A9%8D%EC%A6%88.pdf)

[ERD](https://github.com/qooktree1/DreamMungz/blob/main/exec/ERD.PNG)

[아키텍처](https://github.com/qooktree1/DreamMungz/blob/main/exec/%EC%8B%9C%EC%8A%A4%ED%85%9C%EC%95%84%ED%82%A4%ED%85%8D%EC%B3%90.PNG)

[시연시나리오](https://github.com/qooktree1/DreamMungz/blob/main/exec/%EC%8B%9C%EC%97%B0%EC%8B%9C%EB%82%98%EB%A6%AC%EC%98%A4.pdf)

---

## 🖥️ **서비스 화면**

### 로그인

### 게임 컨텐츠

### 튜토리얼

###
