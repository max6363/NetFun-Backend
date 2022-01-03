# NetFun-Backend

BFF layer (written in Swift). One can setup BFF using Core Classess (which is already added as a dependency of this package. See `Package.swift`).



## Setup
* Clone repo
* Wait for dependecies to resolve.
* Go to root folder & run `swift run`. This should start a server and show something like below in console.
  - `[ NOTICE ] Server starting on http://127.0.0.1:8080`
  
* Note: Now your **BaseURL** is `http://127.0.0.1:8080/api`

## Access Data Using API Endpoint

### 1. Fetch Profiles for a User
Endpoint: `/{BaseURL}/profiles`

e.g. => `http://127.0.0.1:8080/api/profiles`

Response
 ```
 [
    {
        "id": 1,
        "name": "John Doe",
        "username": "john32"
    },
    {
        "id": 2,
        "name": "Mike Hanigan",
        "username": "mikeH"
    },
    {
        "id": 3,
        "name": "Max Payne",
        "username": "max-8000"
    },
    {
        "id": 4,
        "name": "ZK Bill",
        "username": "zkb1212"
    },
    {
        "id": 5,
        "name": "Sarah M.",
        "username": "sarah"
    }
]
 ```

### 2. Fetch Data for Home Page for a Profile

Endpoint: `{BaseURL}/profilehome/{profileId}`

e.g. : `http://127.0.0.1:8080/api/profilehome/700` where `700` is `profileId`

Response
```
{
    "id": 7,
    "profile": {
        "id": 2,
        "name": "Mike Hanigan",
        "username": "mikeH"
    },
    "collection": [
        {
            "id": 500,
            "title": "Continue Watching",
            "items": [
                {
                    "id": 1,
                    "cast": [
                        {
                            "id": 12,
                            "name": "Actor 1"
                        },
                        {
                            "id": 13,
                            "name": "Actor 2"
                        }
                    ],
                    "title": "Ice Age 1",
                    "media": [
                        {
                            "mediaType": "video",
                            "duration": 95
                        }
                    ],
                    "releasedDate": "2003-08-12T20:17:46Z",
                    "type": "movie",
                    "writers": [
                        {
                            "id": 14,
                            "name": "Writer 1"
                        }
                    ],
                    "director": {
                        "id": 11,
                        "name": "John Parker"
                    }
                },
                {
                    "id": 2,
                    "cast": [
                        {
                            "id": 12,
                            "name": "Actor 1"
                        },
                        {
                            "id": 13,
                            "name": "Actor 2"
                        }
                    ],
                    "title": "Arya 2",
                    "media": [
                        {
                            "id": 1001,
                            "title": "Episode 1",
                            "mediaType": "video",
                            "duration": 45
                        },
                        {
                            "id": 1002,
                            "title": "Episode 2",
                            "mediaType": "video",
                            "duration": 40
                        },
                        {
                            "id": 1003,
                            "title": "Episode 3",
                            "mediaType": "video",
                            "duration": 55
                        }
                    ],
                    "releasedDate": "2019-08-12T20:17:46Z",
                    "type": "series",
                    "writers": [
                        {
                            "id": 14,
                            "name": "Writer 1"
                        }
                    ],
                    "director": {
                        "id": 11,
                        "name": "John Parker"
                    }
                }
            ]
        },
        {
            "id": 502,
            "title": "Kids Movies",
            "items": [
                {
                    "id": 1,
                    "cast": [
                        {
                            "id": 12,
                            "name": "Actor 1"
                        },
                        {
                            "id": 13,
                            "name": "Actor 2"
                        }
                    ],
                    "title": "Madagaskar",
                    "media": [
                        {
                            "mediaType": "video",
                            "duration": 85
                        }
                    ],
                    "releasedDate": "2003-08-12T20:17:46Z",
                    "type": "movie",
                    "writers": [
                        {
                            "id": 14,
                            "name": "Writer 1"
                        }
                    ],
                    "director": {
                        "id": 11,
                        "name": "John Parker"
                    }
                },
                {
                    "id": 2,
                    "cast": [
                        {
                            "id": 12,
                            "name": "Actor 1"
                        },
                        {
                            "id": 13,
                            "name": "Actor 2"
                        }
                    ],
                    "title": "Micky Mouse & Friends",
                    "media": [
                        {
                            "id": 1001,
                            "title": "Episode 1",
                            "mediaType": "video",
                            "duration": 45
                        },
                        {
                            "id": 1002,
                            "title": "Episode 2",
                            "mediaType": "video",
                            "duration": 40
                        },
                        {
                            "id": 1003,
                            "title": "Episode 3",
                            "mediaType": "video",
                            "duration": 55
                        },
                        {
                            "id": 1004,
                            "title": "Episode 4",
                            "mediaType": "video",
                            "duration": 42
                        },
                        {
                            "id": 1005,
                            "title": "Episode 5",
                            "mediaType": "video",
                            "duration": 47
                        }
                    ],
                    "releasedDate": "1995-08-12T20:17:46Z",
                    "type": "series",
                    "writers": [
                        {
                            "id": 14,
                            "name": "Writer 1"
                        }
                    ],
                    "director": {
                        "id": 11,
                        "name": "John Parker"
                    }
                }
            ]
        }
    ]
}
```

## A Client App (iOS/SwiftUI)

Repository: [NetFun-ios-app](https://github.com/max6363/NetFun-ios-app)

Just Clone and follow instructions of README file.


## Planned + Future Tasks

:white_check_mark: setup using [vapor](https://github.com/vapor/vapor)

:white_check_mark: create enpoints

:white_large_square: implement database & write connectivity. i.e. Postgresql, MongoDB, etc.

:white_large_square: implement authentication + accesstoken


