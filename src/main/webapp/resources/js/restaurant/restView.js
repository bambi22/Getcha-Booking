$(document).ready(function(){
	// 관심 식당 등록 버튼
	$('#collect_btn').on('click',function(){
		var target = $(this);
		var num = $(this).attr('data-num');
		$.ajax({	
	 	   url : "collectProc", type: "POST",
	 	   data : "reviewNum="+num,
	 	   contentType: "application/x-www-form-urlencoded; charset=utf-8",
	 	   success : function(data) {
			if(data.result == "success"){
				$(target).children().attr('src', "resources/img/icon/full_ht.png");
				$(target).children().attr('alt', "저장된 상태");
				}else{
					alert("저장한 식당입니다.");
					}
			},
	 	   error: function(e){
	 		   alert("error: " + e);
	 	   }
		});
	});
		
	/*function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'text',
      content: {
        title: '제목',
        description: '설명',
        imageUrl:
          '이미지 도메인',
        link: {
          mobileWebUrl: '모바일 링크',
          webUrl: '웹 링크',
        },
      },
      social: {
        likeCount: 286,  //좋아요 수
        commentCount: 45,  //댓글 수
        sharedCount: 845,  //공유 수
      },
      buttons: [
        {
          title: '웹으로 보기',  //첫 번째 버튼 
          link: {
            mobileWebUrl: '모바일 링크',  //버튼 클릭 시 이동 링크
            webUrl: '웹 링크',
          },
        },
      ],
    })
  }*/

	/*	$(".pageNav a").on('click', function(){
			window.scrollTo({top:$("#reviewList").offset().top, left:0, behavior:'auto'});
		}); */
		
	});