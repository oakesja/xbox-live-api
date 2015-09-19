# xbox 360 games
GET  https://achievements.xboxlive.com/users/xuid(2533274912330216)/history/titles?platforms=1,2,15,16,17&types=1,3&orderBy=unlockTime 

```json
{
  "titles": [
    {
      "lastPlayed": "2015-03-29T21:19:14.7470000Z",
      "currentAchievements": 30,
      "currentGamerscore": 400,
      "sequence": 122,
      "titleId": 1480659964,
      "titleType": 3,
      "platforms": [
        1
      ],
      "name": "AC Liberation HD",
      "totalAchievements": 30,
      "totalGamerscore": 400
    },
    {
      "lastPlayed": "2015-03-19T22:37:28.5600000Z",
      "currentAchievements": 50,
      "currentGamerscore": 1000,
      "sequence": 92,
      "titleId": 1431505093,
      "titleType": 1,
      "platforms": [
        1
      ],
      "name": "South Park™: TSOT",
      "totalAchievements": 50,
      "totalGamerscore": 1000
    }
  ],
  "pagingInfo": {
    "continuationToken": "32,2015-07-17T02:59:33.2830000Z",
    "totalRecords": 59
  },
  "version": "2015-07-17T02:59:33.2830000Z"
}

```


# xbox one games 
GET  https://achievements.xboxlive.com/users/xuid(2533274912330216)/history/titles?orderBy=unlockTime

```json
{
  "titles": [
    {
      "lastUnlock": "2015-07-17T01:17:13.9301807Z",
      "titleId": 264259050,
      "serviceConfigId": "96430100-71ae-4488-8791-79d50fc045ea",
      "titleType": "DGame",
      "platform": "Durango",
      "name": "Ori and the Blind Forest",
      "earnedAchievements": 6,
      "currentGamerscore": 70,
      "maxGamerscore": 1000
    },
    {
      "lastUnlock": "2015-07-16T01:31:05.8747011Z",
      "titleId": 1799887933,
      "serviceConfigId": "de360100-3ae5-4fd5-a7da-9d3d6b481c3d",
      "titleType": "DGame",
      "platform": "Durango",
      "name": "The Witcher 3: Wild Hunt",
      "earnedAchievements": 48,
      "currentGamerscore": 860,
      "maxGamerscore": 1000
    }
  ],
  "pagingInfo": {
    "continuationToken": null,
    "totalRecords": 28
  }
}
```

Note: can use v1 for 360 games

# game achievement by game id
GET https://achievements.xboxlive.com/users/xuid(2533274912330216)/history/titles/?titleId={264259050,<game_id>,...} HTTP/1.1

``` json
{
  "titles": [
    {
      "lastUnlock": "2015-07-17T01:17:13.9301807Z",
      "titleId": 264259050,
      "serviceConfigId": "96430100-71ae-4488-8791-79d50fc045ea",
      "titleType": "DGame",
      "platform": "Durango",
      "name": "Ori and the Blind Forest",
      "earnedAchievements": 6,
      "currentGamerscore": 70,
      "maxGamerscore": 1000
    }
  ],
  "pagingInfo": {
    "continuationToken": null,
    "totalRecords": 1
  }
}
```

# unknown
GET  https://achievements.xboxlive.com/users/xuid(2533274912330216)/achievements?titleId=264259050&types=Challenge&orderby=EndingSoon 

```json
{
  "achievements": [],
  "pagingInfo": {
    "continuationToken": null,
    "totalRecords": 0
  }
}
```

# unknown
GET  https://achievements.xboxlive.com/users/xuid(2533274912330216)/history/titles/?titleId=659358693 HTTP/1.1

```json
{
  "titles": [],
  "pagingInfo": {
    "continuationToken": null,
    "totalRecords": 0
  }
}
```

# Featured challenges/achievements
GET https://achievements.xboxlive.com/users/xuid(2533274912330216)/featured?maxItems=10&orderBy=Endingsoon 

```json
{
  "featuredAchievements": [
    {
      "Achievement": {
        "id": "61",
        "serviceConfigId": "fecc0100-9c95-4b8e-b34d-42ee40f1860b",
        "name": "Rookie Devil Hunter",
        "titleAssociations": [
          {
            "name": "Devil May Cry 4 Special Edition",
            "id": 1089570315
          }
        ],
        "progressState": "NotStarted",
        "progression": {
          "requirements": [
            {
              "id": "58b0e6b2-9566-4d76-af40-7c4a2063edc3",
              "current": null,
              "target": "100",
              "operationType": "Sum",
              "valueType": "Integer",
              "ruleParticipationType": "Individual"
            }
          ],
          "timeUnlocked": "0001-01-01T00:00:00.0000000Z"
        },
        "mediaAssets": [
          {
            "name": "ac7e5469-4d93-468c-8b7c-44e2f4723a16.png",
            "type": "Icon",
            "url": "http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToArfGPUyqiafNNuuln9QDuLyM3DYGKWjw_AnY2iMAgokUAFg5swjyntE3OZzmXVyk.iR_vmZ8LNCMFoxpS_Y3OTe_.UMSNtTttqmo0KXzcPoJM6ozng2Q7dJ3ccWqnIMh36ZGSGuGg4uXDzc.zWvxaq"
          },
          {
            "name": "e8d9ce51-4602-48ef-9bbb-83631654bb8c.png",
            "type": "ChallengePromoIcon",
            "url": "http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToArfGPUyqiafNNuuln9QDuLyM3DYGKWjw_AnY2iMAgokUAFg5swjyntE3OZzmXVyk8mZzXcu0WLUuvPRb30bGx5_.qv_o0PRQ1jtb5i.jeYy1hi6xl4sZ4fOpnr_kCxiwgBVhwM12euvcBd2f4Pr6kC"
          }
        ],
        "platforms": [
          "Durango"
        ],
        "isSecret": false,
        "description": "Defeated 100 enemies.",
        "lockedDescription": "Defeat 100 enemies.",
        "productId": "4e9308b2-0d06-4f1d-814f-3c5033485a46",
        "achievementType": "Challenge",
        "participationType": "Individual",
        "timeWindow": {
          "startDate": "2015-06-17T00:00:00.0000000Z",
          "endDate": "2015-07-31T23:59:00.0000000Z"
        },
        "rewards": [
          {
            "name": "Unlocked Rookie Devil Hunter",
            "description": "Rookie Devil Hunter Reward",
            "value": "http://dlassets.xboxlive.com/public/content/fecc0100-9c95-4b8e-b34d-42ee40f1860b/RETAIL/22dd4566-d87c-440a-8ccb-1c8f8dcae1bf.png",
            "type": "Art",
            "mediaAsset": {
              "name": "22dd4566-d87c-440a-8ccb-1c8f8dcae1bf.png",
              "type": "Icon",
              "url": "http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToArfGPUyqiafNNuuln9QDuLyM3DYGKWjw_AnY2iMAgokUAFg5swjyntE3OZzmXVyk_7xq5yqvrZROvNf.0XaMY3SXmKWIe1LVHhywQ65vLMdbxvxO2xpnd5HDiKxWlABM3JRNBoRZkbnIO11WuzgM06"
            },
            "valueType": "String"
          }
        ],
        "estimatedTime": "00:00:00",
        "deeplink": null,
        "isRevoked": false
      }
    }
  ]
}
```

# Achievement for a game by game id
GET https://achievements.xboxlive.com/users/xuid(2533274912330216)/achievements?titleId=264259050&orderBy=EndingSoon&maxItems=150 

```json
{
  "achievements": [
    {
      "id": "35",
      "serviceConfigId": "96430100-71ae-4488-8791-79d50fc045ea",
      "name": "A New Path",
      "titleAssociations": [
        {
          "name": "Ori and the Blind Forest",
          "id": 264259050
        }
      ],
      "progressState": "Achieved",
      "progression": {
        "requirements": [
          {
            "id": "42fbcc03-f7d9-40c2-a31f-89d94350d292",
            "current": "1",
            "target": "1",
            "operationType": "Maximum",
            "valueType": "Integer",
            "ruleParticipationType": "Individual"
          }
        ],
        "timeUnlocked": "2015-07-17T01:17:13.9301807Z"
      },
      "mediaAssets": [
        {
          "name": "66832994-7599-460b-86d7-ad3a85e75c04.png",
          "type": "Icon",
          "url": "http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToCxFSdNlsv0ysTfD.MFspsOi9KMvWH0b.trY74cVQL4_nj4u8eVcsrHYztyVXCSuP7divzcij.s_6n8edXmQJ_DiTr0tNleHHBdMKMPIvE8KkwWP0isDB3AB_3wYPzDSngzpb4ie0opA2pibWitXz3y"
        }
      ],
      "platforms": [
        "Durango"
      ],
      "isSecret": false,
      "description": "Opened 5 shortcuts using the Charge Flame",
      "lockedDescription": "Break open 5 shortcuts using the Charge Flame",
      "productId": "0bb3a78d-ea8a-48e2-9049-eec15e61c078",
      "achievementType": "Persistent",
      "participationType": "Individual",
      "timeWindow": null,
      "rewards": [
        {
          "name": null,
          "description": null,
          "value": "10",
          "type": "Gamerscore",
          "mediaAsset": null,
          "valueType": "Int"
        }
      ],
      "estimatedTime": "00:00:00",
      "deeplink": null,
      "isRevoked": false
    }
  ],
  "pagingInfo": {
    "continuationToken": null,
    "totalRecords": 1
  }
}
```

# Friends list
GET social.xboxlive.com/users/xuid(2533274912330216)/people

```json
{
  "totalCount": 12,
  "people": [
    {
      "xuid": "2533274943359027",
      "isFavorite": false,
      "socialNetworks": [
        "LegacyXboxLive"
      ],
      "isFollowedByCaller": true,
      "isFollowingCaller": true,
      "isIdentityShared": true
    }
  ]
}  
```

# Recent players
GET /users/xuid(2533274912330216)/recentplayers?maxItems=1000
Host: social.xboxlive.com

```json
{
  "recentPlayers": [
    {
      "xuid": "2533274919348744",
      "isFollowedByCaller": false,
      "isFollowingCaller": false,
      "titles": [
        {
          "titleId": "860666361",
          "titleName": "Plants vs. Zombies Garden Warfare",
          "lastPlayedWithDateTimeUtc": "2015-06-18T02:57:56.4132054Z"
        }
      ]
    }
  ]
}    
```

# Friend summary
GET /users/xuid(2533274912330216)/summary
Host: social.xboxlive.com

```json
{
  "targetFollowingCount": 12,
  "targetFollowerCount": 13,
  "isCallerFollowingTarget": false,
  "isTargetFollowingCaller": false,
  "hasCallerMarkedTargetAsFavorite": false,
  "hasCallerMarkedTargetAsIdentityShared": false,
  "legacyFriendStatus": "None",
  "availablePeopleSlots": 999,
  "recentChangeCount": 0,
  "watermark": "5247413005989012295"
}
```


