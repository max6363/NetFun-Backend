//
//  File.swift
//  
//
//  Created by Minhaz on 30/12/21.
//

import Fluent
import Vapor
import NetFunCore

struct ProfileHomeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.on(Endpoints.ProfileHome.getAll, use: getHomeProfileData)
    }
    
    func getHomeProfileData(req: Request) throws -> HomeContentAPIModel {

        guard let id = try? req.parameters.require("profileID"),
                let profileID = Int(id) else {
            throw NetFunError.missingParameter(name: "profileID")
        }
        
        do {
            let resposne = try ProfileHomeController.getHomeContentForProfile(profileId: Int(profileID))
            return resposne
        } catch {
            print("getAllHandler: error: \(error)")
            throw NetFunError.other(description: "Eror fetching profiles: \(error.localizedDescription)")
        }
    }
}

extension ProfileHomeController {
    
    static func getHomeContentForProfile(profileId: Int) throws -> HomeContentAPIModel {
        var jsonString = ""
        
        switch profileId {
        case 1:
            jsonString = profileForID3 // TODO: to add more dummy values
            break
        case 2:
            jsonString = profileForID2
            break
        case 700:
            jsonString = profileForID1
            break
        default:
            jsonString = profileForID2 // default case
            break
        }
        
        do {
            let modelData = try JSONDecoder().decode(HomeContentAPIModel.self,
                                                    from: jsonString.data(using: .utf8)!)
            return modelData
        } catch {
            print("parsing error", error)
            throw NetFunError.other(description: "Internal server error")
        }
    }
    
    static let profileForID1 = """
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
                        "title": "Ice Age 1",
                        "type": "movie",
                        "releasedDate": "2003-08-12T20:17:46Z",
                        "director": {
                            "id": 11,
                            "name": "John Parker"
                        },
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
                        "writers": [
                            {
                                "id": 14,
                                "name": "Writer 1"
                            }
                        ],
                        "media": [
                            {                                
                                "duration": 95,
                                "mediaType": "video"
                            }
                        ]
                    },
                    {
                        "id": 2,
                        "title": "Arya 2",
                        "type": "series",
                        "releasedDate": "2019-08-12T20:17:46Z",
                        "director": {
                            "id": 11,
                            "name": "John Parker"
                        },
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
                        "writers": [
                            {
                                "id": 14,
                                "name": "Writer 1"
                            }
                        ],
                        "media": [
                            {
                                "id": 1001,
                                "title": "Episode 1",
                                "duration": 45,
                                "mediaType": "video"
                            },
                            {
                                "id": 1002,
                                "title": "Episode 2",
                                "duration": 40,
                                "mediaType": "video"
                            },
                            {
                                "id": 1003,
                                "title": "Episode 3",
                                "duration": 55,
                                "mediaType": "video"
                            }
                        ]
                    }
                ]
            },
            {
                "id": 502,
                "title": "Kids Movies",
                "items": [
                    {
                        "id": 1,
                        "title": "Madagaskar",
                        "type": "movie",
                        "releasedDate": "2003-08-12T20:17:46Z",
                        "director": {
                            "id": 11,
                            "name": "John Parker"
                        },
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
                        "writers": [
                            {
                                "id": 14,
                                "name": "Writer 1"
                            }
                        ],
                        "media": [
                            {
                                "duration": 85,
                                "mediaType": "video"
                            }
                        ]
                    },
                    {
                        "id": 2,
                        "title": "Micky Mouse & Friends",
                        "type": "series",
                        "releasedDate": "1995-08-12T20:17:46Z",
                        "director": {
                            "id": 11,
                            "name": "John Parker"
                        },
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
                        "writers": [
                            {
                                "id": 14,
                                "name": "Writer 1"
                            }
                        ],
                        "media": [
                            {
                                "id": 1001,
                                "title": "Episode 1",
                                "duration": 45,
                                "mediaType": "video"
                            },
                            {
                                "id": 1002,
                                "title": "Episode 2",
                                "duration": 40,
                                "mediaType": "video"
                            },
                            {
                                "id": 1003,
                                "title": "Episode 3",
                                "duration": 55,
                                "mediaType": "video"
                            },
                            {
                                "id": 1004,
                                "title": "Episode 4",
                                "duration": 42,
                                "mediaType": "video"
                            },
                            {
                                "id": 1005,
                                "title": "Episode 5",
                                "duration": 47,
                                "mediaType": "video"
                            }
                        ]
                    }
                ]
            }
        ]
    }
    """
    
    static let profileForID2 = """
        {
                    "profile": {
                        "id": 2,
                        "name": "Mike Hanigan",
                        "username": "mikeH"
                    },
                    "collection1": [
                        {
                            "id": 500,
                            "name": "Continue Watching",
                            "items": [
                                {
                                    "id": 2,
                                    "type": "movie",
                                    "name": "Ice Age 2",
                                    "duration": 100,
                                    "releasedDate": "2005-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                },
                                {
                                    "id": 3,
                                    "type": "series",
                                    "name": "Money Heist",
                                    "releasedDate": "2019-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "episodes": [
                                        {
                                            "id": 4,
                                            "name": "Episode 1",
                                            "duration": 120,
                                            "next": 5,
                                        },
                                        {
                                            "id": 5,
                                            "name": "Episode 2",
                                            "duration": 100,
                                            "next": 6,
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                }
                            ]
                        },
                        {
                            "id": 600,
                            "name": "Kids Movies",
                            "items": [
                                {
                                    "id": 2,
                                    "type": "movie",
                                    "name": "Madagaskar",
                                    "duration": 100,
                                    "releasedDate": "2005-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                },
                                {
                                    "id": 3,
                                    "type": "movie",
                                    "name": "Ice Age 4",
                                    "duration": 130,
                                    "releasedDate": "2012-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                },
                                {
                                    "id": 4,
                                    "type": "movie",
                                    "name": "Up",
                                    "duration": 140,
                                    "releasedDate": "2013-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                },
                                {
                                    "id": 5,
                                    "type": "movie",
                                    "name": "The Incredibles",
                                    "duration": 110,
                                    "releasedDate": "2010-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                }
                            ]
                        }
                    ]
                }
        """
    
    static let profileForID3 = """
        {
                    "profile": {
                        "id": 2,
                        "name": "Mike Hanigan",
                        "username": "mikeH"
                    },
                    "collection1": [
                        {
                            "id": 500,
                            "name": "Continue Watching",
                            "items": [
                                {
                                    "id": 2,
                                    "type": "movie",
                                    "name": "Ice Age 2",
                                    "duration": 100,
                                    "releasedDate": "2005-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                },
                                {
                                    "id": 3,
                                    "type": "series",
                                    "name": "Money Heist",
                                    "releasedDate": "2019-08-12T20:17:46Z",
                                    "director": {
                                        "id": 11,
                                        "name": "John Parker"
                                    },
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
                                    "writers": [
                                        {
                                            "id": 14,
                                            "name": "Writer 1"
                                        }
                                    ],
                                    "episodes": [
                                        {
                                            "id": 4,
                                            "name": "Episode 1",
                                            "duration": 120,
                                            "next": 5,
                                        },
                                        {
                                            "id": 5,
                                            "name": "Episode 2",
                                            "duration": 100,
                                            "next": 6,
                                        }
                                    ],
                                    "short": "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    "long": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                                }
                            ]
                        }
                    ]
                }
        """
}
