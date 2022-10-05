const url = 'http://localhost:8080';
let stompClient;
let selectedUser;
let newMessage = new Map();


function connectToChat(username) {

    console.log("connecting to chat...");


    /*====================================================================================
        1.Create a STOMP client
        클라이언트는 SockJS를 기반으로 하는 STOMP 프로토콜을 이용해서 서버와 통신한다.

        WebSocket 만 사용하고 싶은 경우에는 다음과 같다.
        const socket = new WebSocket(url + '/chat');
        const stomp = Stomp.over(socket);

    ====================================================================================*/

    let socket = new SockJS(url + '/chat');
    stompClient = Stomp.over(socket);



    /*==================================================================================
        2. Connection to the server(STOMP Broker)
        2.1. STOMP client는 웹 소켓을 사용하여 연결을 열고 STOMP 메시지(CONNECT 프레임)을 서버에 전송한다.

             CONNECT
             accept-version:1.1,1.0
             heart-beat:10000,10000
    ===================================================================================*/

    stompClient.connect({}, function (frame) {

        console.log(`frame : {}`, frame);

        /*====================================================================================
            3. Subscribe and receive messages (구독)
            3.1. 클라언트가 서버로 부터 메시지를 수신하려면 가장 먼저 서버에 특정 경로에 대해 구독을 요청한다.

               SUBSCRIBE
               id:sub-0
               destination:/topic/messages/test
        ====================================================================================*/

        stompClient.subscribe("/topic/messages/" + username, function (message) {
            // Callback Function
            // called when the client receives a STOMP message from the server
            let data = JSON.parse(message.body);
            alert('result : ' + (data.fromLogin == selectedUser));

            if (selectedUser != data.fromLogin) {
                newMessage.set(data.fromLogin, data.message);
                $('#userNameAppender_' + data.fromLogin).append("<span id='newMessage_" + data.fromLogin + "' style='color: red;'>NEW</span>");
            }
            render(data.message, data.fromLogin);

        });
    });
}



/*====================================================================================
    4. Send Message (발행) : 서버에 메시지를 전송한다.
       4.1. STOMP destination, message headers and body
       4.2. he body of a STOMP message must be a String.

    SEND
    destination:/app/chat/kso
    content-length:39
    {"message":"Hello", "fromLogin":"hong"}
====================================================================================*/


function sendMsg(from, text) {

    console.log('from : ', from, 'text : ', text);
    console.log(`selectedUser : ${selectedUser}`);
    console.log(`stompClient : ${stompClient}`);

    stompClient.send('/app/chat/' + selectedUser, {}, JSON.stringify({
        message: text,
        fromLogin: from
    }));

}



/*====================================================================================
    사용자 등록
====================================================================================*/



function registration() {
    let username = $('#username').val();

    $.ajax({
        url: url + "/registration/" + username,
        success: function(response) {
            console.log(`response : ${response}`);
            connectToChat(username);
        },
        error: function(ex) {
            console.log(`ex : ${ex}`);
            if (ex.status === 400) {
                alert("Login is already busy!")
            }
        }
    });

    $('#username').attr("disabled", "disabled");
}





function selectUser(username) {
    console.log('selecting user : ', username);
    selectedUser = username;

    let isNew = document.getElementById("newMessage_" + username);
    if (isNew != null) {
        let element = document.getElementById("newMessage_" + username);
        console.log("element : " + element);
        element.parentNode.removeChild(element);
        console.log("key : " + newMessage.get(username));
        render(newMessage.get(username), username);
    }

    $('#selectedUserId').html('');
    $('#selectedUserId').append('Chat with ' + username);
}




/*====================================================================================
    사용자 리스트 조회
====================================================================================*/


function fetchAll() {
    $.get(url + "/fetchAllUsers", function (response) {
        let users = response;
        let usersTemplateHTML = "";
        for (let i = 0; i < users.length; i++) {
            usersTemplateHTML = usersTemplateHTML + '<a href="#" onclick="selectUser(\'' + users[i] + '\')"><li class="clearfix">\n' +
                '                <img src="https://rtfm.co.ua/wp-content/plugins/all-in-one-seo-pack/images/default-user-image.png" width="55px" height="55px" alt="avatar" />\n' +
                '                <div class="about">\n' +
                '                    <div id="userNameAppender_' + users[i] + '" class="name" style="color: white;">' + users[i] + '</div>\n' +
                '                    <div class="status">\n' +
                '                        <i class="fa fa-circle offline"></i>\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '            </li></a>';
        }
        $('#usersList').html(usersTemplateHTML);
    });
}


