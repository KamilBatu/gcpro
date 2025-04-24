# Contributing to Bita-Mobile

Thank you for considering contributing to our Flutter project! We appreciate your time and effort in improving the app. Please follow the guidelines below to ensure a smooth collaboration process.

---

## 🛠 Code Style Guidelines


### File Naming
- **Use snake_case** for all file and directory names.  
  ✅ Example: `user_profile.dart`  
  ❌ Avoid: `UserProfile.dart`, `userProfile.dart`


### Variable and Constant Naming
- Follow **Dart's naming conventions**:
  - Variables: `camelCase` (e.g., `userName`, `itemList`)
  - Constants: `UPPER_SNAKE_CASE` (e.g., `API_KEY`, `DEFAULT_TIMEOUT`)
  - Classes: `PascalCase` (e.g., `UserProfile`, `ProductManager`)


### Folder Structure
- Maintain a **logical and organized folder structure**.
- Group related files into modules or features.
- follow the structure depicted in `folder_structure.md`


## 📦 Package Usage Guidelines
- Use packages that are **well-maintained and trusted**.
- A package must have **at least 100 likes** on [pub.dev](https://pub.dev/).
- Avoid packages with recent issues or a long history of unresolved bugs.


## 🚀 Best Practices
- Write **clean, readable, and documented code**.
- Keep widget tree depth manageable; refactor complex widgets into reusable components.
- Avoid writing large functions. Break them down into smaller, testable functions.
- Write **unit tests** for critical functionalities.
- Comment your code sparingly but effectively to explain **why**, not just **what**.


## ✅ Pull Request Guidelines
1. Ensure your code passes all existing tests.
2. Write new tests for any added or changed functionality.
3. Run `flutter analyze` and fix all linter issues before submitting.
4. Add appropriate documentation for your changes.
5. Follow the commit message convention:  
 - **feat:** Adding new features  
 - **fix:** Fixing bugs  
 - **docs:** Updating documentation  
 - **refactor:** Code refactoring  
 - **test:** Adding or updating tests  
 - **chore:** Other updates like dependency changes or build process updates  

