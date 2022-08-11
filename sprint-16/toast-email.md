# 토스트 이메일 API

1. 일반메일발송
    - 템플릿 치환으로 발송할 예정
2. 만약 1~5번의 메일전송이 확정이라면 해당내용으로 예약메일을 발송할수없는지?
    - 중간에 결제가되거나 취소되면 모든 예약메일이 취소가되는지?
3. db를긁어서 발송 or Request Param에 DB정보가 포함
4. 발송 정보는 어느 DB에 넣을것인가?

## 일반메일

> URL

`(POST) /email/v2.0/appKeys/{appKey}/sender/mail`
appKey : String (고유 AppKey)

> Header

```ts
{
    "X-Secret-Key": "String"
}
```

> Request Body

- 필수값만 넣엇습니다.

```ts
{
    "senderAddress": String => 발신자 메일 주소 (MaxLength : 100)
    "title": String => 메일 제목 (MaxLength : 998)
    "body": String => 메일 내용
    "receiverList": [receiverListInterface] => {
        "receiverMailAddr": String => 수신자 메일주소
        "receiveType": String => 수신자 타입 (MRT0 : 받는사람, MRT1 : 참조, MRT2: 숨은참조)
    }
}
```

- 필수값 + 필수가 아닌값

![일반메일](asset/image/일반메일RequestBody.png)

> Response

```ts
{
    "header": {
        "resultCode": Integer => 실패 코드
        "resultMessage": String => 실패 메시지(사유)
        "isSuccessful": Boolean => 성공 여부
    },
    "body": {
        "data": {
            "requestId": String => 요청ID
            "results": [
                {
                    "receiveMailAddr": String => 수신자 메일 주소
                    "receiveName": String => 수신자 명
                    "receiveType": String => 수신자 타입 (MRT0 : 받는사람, MRT1 : 참조, MRT2: 숨은참조)
                    "resultCode": Integer => 수신자 발송 요청 결과 코드
                    "resultMessage": String => 수신자 발송 요청 결과 메시지.
                }
            ]
        }
    }
}
```