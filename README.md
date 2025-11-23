# Advent of Code 2015 - Swift

Swift solutions for the Advent of Code 2015 challenges.

## ⚙️ Setup & Configuration

### 1. Input Downloading
This project is configured to automatically download your puzzle input if the local file in Sources/Inputs/ is missing or empty. To enable this, you must provide your session cookie.

**How to get your session cookie:**
1. Log in to adventofcode.com.
2. Open Chrome/Safari Developer Tools (Right click anywhere on the page -> Inspect).
3. Go to the **Network** tab.
4. Refresh the page.
5. Click the request for the page (usually the top one, e.g., adventofcode.com).
6. Look at the **Request Headers** section for the header named Cookie.
7. Copy the long alphanumeric string value for session (copy the value *after* session=).

### 2. Environment Variable
You must set the environment variable AOC_SESSION to the value you copied above.

---

## 🚀 Running via Command Line (CLI)

You can run specific days using swift run.

**Syntax:**
```bash
swift run AdventOfCode2015 <subcommand>
```

**Examples:**

Run Day 1:
```bash
swift run AdventOfCode2015 day01
```

---

## 🛠️ Running via Xcode

Double-click Package.swift to open the project in Xcode.

### Setting up the Run Scheme
To run the app, you need to tell Xcode **which day** to run and provide the **session cookie**.



#### Step 1: Open the Scheme Editor
1. Click the target name AdventOfCode2015 in the top toolbar (next to the Play/Stop buttons).
2. Select **"Edit Scheme..."** from the dropdown menu (or press Cmd + <).
3. Ensure **Run** is selected in the left sidebar.

#### Step 2: Add the Day (Argument)
1. Click the **Arguments** tab in the center.
2. Look at the top section: **"Arguments Passed On Launch"**.
3. Click the + button.
4. Enter the subcommand for the day you want to solve (e.g., day01).
   * *Note: When you move to the next day, you must return here, delete day01, and add day02.*

#### Step 3: Add the Cookie (Environment Variable)
1. Still in the **Arguments** tab, look at the bottom section: **"Environment Variables"**.
2. Click the + button.
3. **Name:** AOC_SESSION
4. **Value:** Paste your session cookie string here.
5. Ensure the checkbox next to it is checked.

#### Step 4: Run
1. Close the Scheme dialog.
2. Press **Cmd + R** to run the solution.
3. The output will appear in the bottom Console area.
