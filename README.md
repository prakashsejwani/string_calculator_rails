# String Calculator Rails

A Rails application implementing the String Calculator Kata with a modern React frontend, following Test-Driven Development (TDD) and Behavior-Driven Development (BDD) principles.

## 🎯 Overview

This application provides a web-based string calculator that can add numbers from a string with various delimiters. It's built using Ruby on Rails with a React frontend, following the String Calculator Kata requirements.

## ✨ Features

### Core Calculator Features
- **Empty string returns 0**
- **Single number support** (e.g., "5" → 5)
- **Two numbers with comma delimiter** (e.g., "1,2" → 3)
- **Unknown amount of numbers** (e.g., "1,2,3,4,5" → 15)
- **Newline delimiters** (e.g., "1\n2,3" → 6)
- **Custom single-char delimiters** (e.g., "//;\n1;2" → 3)
- **Custom long delimiters** (e.g., "//[***]\n1***2***3" → 6)
- **Multiple delimiters** (e.g., "//[*][%]\n1*2%3" → 6)
- **Multiple long delimiters** (e.g., "//[**][%%%]\n1**2%%%3" → 6)
- **Negative number validation** (throws exception with all negatives listed)
- **Numbers > 1000 are ignored** (e.g., "2,1001" → 2, "1001" → 0)
- **Error handling for malformed delimiters**

### Technical Features
- **Rails MVC Architecture** with service layer
- **React Frontend** with modern UI and responsive design
- **Rails Importmaps** for JavaScript dependency management
- **Comprehensive Testing** with RSpec and Cucumber
- **API Endpoint** for calculator functionality
- **Error Handling** with proper HTTP status codes

## 🚀 Quick Start

### Prerequisites
- Ruby 3.3.6+
- Rails 8.0.3+
- Node.js (for JavaScript dependencies)
- SQLite3

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd string_calculator_rails
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   Open your browser and go to `http://localhost:3000`

## 🧪 Running Tests

### RSpec Tests (Unit Tests)
```bash
# Run all RSpec tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/services/string_calculator_spec.rb

# Run with coverage
bundle exec rspec --format documentation
```

### Cucumber Tests (BDD/UI Tests)
```bash
# Run all Cucumber scenarios
bundle exec cucumber

# Run specific feature file
bundle exec cucumber features/string_calculator_ui.feature

# Run with progress format
bundle exec cucumber --format progress
```

### Run All Tests
```bash
# Run both RSpec and Cucumber
bundle exec rspec && bundle exec cucumber
```

## 📋 Test Coverage

### RSpec Tests (13 examples)
- ✅ Empty string returns 0
- ✅ Single number handling
- ✅ Two comma-separated numbers
- ✅ Multiple comma-separated numbers
- ✅ Newline delimiter support
- ✅ Custom single-char delimiter
- ✅ Negative number validation
- ✅ Numbers > 1000 ignored (multiple numbers)
- ✅ Numbers > 1000 ignored (single number)
- ✅ Long custom delimiter support
- ✅ Multiple delimiter support
- ✅ Multiple long delimiter support
- ✅ Malformed delimiter error handling

### Cucumber Scenarios (13 scenarios)
- ✅ Empty string calculation
- ✅ Single number calculation
- ✅ Two comma-separated numbers
- ✅ Multiple comma-separated numbers
- ✅ Newline delimiter calculation
- ✅ Custom single delimiter calculation
- ✅ Long custom delimiter calculation
- ✅ Multiple delimiter calculation
- ✅ Multiple long delimiter calculation
- ✅ Numbers > 1000 ignored (multiple)
- ✅ Numbers > 1000 ignored (single)
- ✅ Negative number error display
- ✅ Malformed delimiter error display

## 🏗️ Architecture

### Backend (Rails)
```
app/
├── controllers/
│   └── string_calculators_controller.rb  # API endpoint
├── services/
│   └── string_calculator.rb             # Core business logic
├── models/
│   └── application_record.rb            # Base model
└── views/
    ├── layouts/
    │   └── application.html.erb         # Main layout
    └── application/
        └── index.html.erb               # React app container
```

### Frontend (React)
```
app/javascript/
└── string_calculator.js                 # React component
```

### Configuration
```
config/
├── routes.rb                            # API routes
├── importmap.rb                        # JavaScript dependencies
└── environments/
    ├── development.rb
    ├── test.rb
    └── production.rb
```

## 🔧 API Usage

### Endpoint
```
POST /string_calculators
Content-Type: application/json

{
  "numbers": "1,2,3"
}
```

### Response Examples

**Success (200)**
```json
{
  "result": 6
}
```

**Error (422)**
```json
{
  "error": "negative numbers not allowed -2,-4"
}
```

## 📝 Supported Input Formats

| Format | Example | Result |
|--------|---------|--------|
| Empty string | `""` | `0` |
| Single number | `"5"` | `5` |
| Comma separated | `"1,2,3"` | `6` |
| Newline delimiter | `"1\n2,3"` | `6` |
| Custom delimiter | `"//;\n1;2"` | `3` |
| Long delimiter | `"//[***]\n1***2***3"` | `6` |
| Multiple delimiters | `"//[*][%]\n1*2%3"` | `6` |
| Numbers > 1000 | `"2,1001"` | `2` |
| Single > 1000 | `"1001"` | `0` |
| Negative numbers | `"1,-2,3"` | Error with negatives listed |

## 🎨 UI Features

### Modern React Interface
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Real-time Calculation**: Instant results with loading states
- **Example Buttons**: Quick input for common formats
- **Error Handling**: Clear error messages with helpful tips
- **Input Validation**: Client-side validation before API calls

### UI Components
- **Input Section**: Textarea for number strings
- **Result Section**: Displays calculation results
- **Examples Section**: Pre-defined input examples
- **Help Section**: Supported format documentation

## 🛠️ Development

### Adding New Features
1. Write failing RSpec test
2. Implement the feature
3. Make test pass
4. Add Cucumber scenario
5. Update UI if needed
6. Commit changes

### Code Quality
- **TDD**: Test-Driven Development with RSpec
- **BDD**: Behavior-Driven Development with Cucumber
- **Clean Code**: Service layer separation
- **Error Handling**: Proper exception handling
- **Responsive Design**: Mobile-first approach

## 📦 Dependencies

### Ruby Gems
- `rails` - Web framework
- `rspec-rails` - Testing framework
- `cucumber-rails` - BDD testing
- `selenium-webdriver` - Browser automation
- `importmap-rails` - JavaScript dependency management

### JavaScript
- `react` - UI library
- `react-dom` - React DOM rendering

## 🚀 Deployment

### Production Setup
1. Set up production database
2. Configure environment variables
3. Run database migrations
4. Precompile assets
5. Start the server

### Environment Variables
- `RAILS_ENV=production`
- Database configuration
- Secret keys

## 📚 String Calculator Kata

This implementation follows the String Calculator Kata requirements:

1. **Basic Requirements**
   - Empty string returns 0
   - Single number returns the number
   - Two numbers separated by comma returns their sum

2. **Advanced Requirements**
   - Unknown amount of numbers
   - Newline as delimiter
   - Custom delimiters
   - Negative number validation
   - Numbers > 1000 ignored
   - Multiple delimiters
   - Long delimiters

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests first (TDD)
4. Implement the feature
5. Run all tests
6. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with ❤️ using Ruby on Rails, React, and modern web technologies.**