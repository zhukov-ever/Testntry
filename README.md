# Testntry

--------------

## Base requirements

Create an iOS app that shows a week's calendar.

The calendar must display the date and weekday of each day and the names of all the events that exist for that day. The events should be Estonian public holidays and holidays from the Estonian Folk Calendar ([Eesti Rahvakalender](https://et.wikipedia.org/wiki/Eesti_rahvakalender)). Public holidays and folk calendar events should be displayed differently. An API to use for this task is provided.
The calendar must be navigable via buttons and have a selection for "first day of the week".

The app must be written in Swift (native), the use of React Native / Xamarin or other cross-platform frameworks is not allowed. 
For storing already requested data on the client side you must use [Realm](https://docs.mongodb.com/realm/sdk/ios/) to reduce the number of server requests needed while navigating the calendar.

The user interface must display reasonably well on all screen sizes and be easy to use. Show us your UI skills.
You are allowed to use any additional libraries that you see fit.

### API description and example

The request format is:

```json
{
  "apiKey": "YOUR_API_KEY",
  "startDate": "2019-02-01",
  "endDate": "2019-02-28"
}
```

A successful response is:

```json
{
  "error": false,
  "holidays": {
    "2019-02-02": [
      {
        "name": "Küünlapäev ehk pudrupäev",
        "type": "folk"
      }
    ],
    "2019-02-09": [
      {
        "name": "Luuvalupäev",
        "type": "folk"
      }
    ],
    "2019-02-22": [
      {
        "name": "Talvine peetripäev",
        "type": "folk"
      }
    ],
    "2019-02-24": [
      {
        "name": "Iseseisvuspäev",
        "type": "public"
      },
      {
        "name": "Talvine madisepäev",
        "type": "folk"
      }
    ]
  }
}
```

An error response is:

```json
{
  "error": true,
  "reason": "invalid-dates" | "invalid-api-key" | "invalid-request"
  }
}
```

**Please note**, that the API returns no more than 30 days of holidays in one call. If a period of more than 30 days is requested, the API will return an error with the reason `invalid-dates`.

### End result

- The code you send us must be buildable in the latest version of Xcode. **You don't have to publish it on the App Store / Testflight.**
- The codebase must be easily readable and commented where necessary.
- Add instructions for any set-up process you see fit.
- Package the files in a compressed archive.

## Self made requirenments 

- iOS 13+
- Xcode 12.5
- Simplified Clean Architecture 

## MVP

Base Requirenmts must be implemented.

**Details:**

- URLSesstion for networking
- Codable for data serialization
- Realm for data store
- Storyboards with Autolayots for UI
- Codegen for resources
- SwiftPM as a package manager

## Further work

I really want to try some technologies. This project seems to be a good candidate.

**Details:**

- Multiple environments
- Fastlane build automation
- Snapkit
- Texture
- Combine
- Tests for services and presentation layer
- Advanced CoreAnimation

## Project review

Project contains DI container called `Assembly`.

Main source code is located at `Testntry/Application` folder.

Model layer contains:

- Use cases - implements business requirenment for the applications

- Services - provides access to API, data storage

UI layer contains 

- Styles - incapsulate styling logic
- Coordinating - contains logic for transitioning between screens
- View - contains ui classes and nibs for screens and components
- Presentation - glue between views and usecases
