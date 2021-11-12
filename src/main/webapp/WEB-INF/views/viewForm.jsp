<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<center>
<%@ include file="member/memberNav.jsp" %>
 <article class="contents">
    <!-- 레스토랑 상세 이미지 슬라이드 -->
    <aside class="restaurant-photos">

        <div class="list-photo_wrap">
                <img class="center-croping"
                     src="resources/restaurant/icon1.png"
                     alt="식당1 대표사진"
                     onerror="">
                <img class="center-croping"
                	 src="resources/restaurant/icon1.png"
                     onerror="this.src=''"/>
				<img class="center-croping"
                	 src="resources/restaurant/icon1.png"
                     onerror="this.src=''"/>
              
        </div>
    </aside>
</article>
    <div class="column-wrapper">
      <!-- 데스크탑 컨텐츠 영역 -->
      <div class="column-contents">
        <div class="inner">
          <!-- 레스토랑 상세 -->
          <section class="restaurant-detail">
            <header>
              <div class="restaurant_title_wrap">
                <span class="title">
                  <h1 class="restaurant_name">식당 이름</h1>
                  <strong class="rate-point ">
                      <span>별 점 4.4</span>
                    </strong>
                  <c:if test="${!empty login }">
                  <button class="btn-type-icon favorite wannago_btn " data-restaurant_uuid="439017" data-action_id="">컬렉션</button>
                   </c:if>
                </span>
              </div>
	              <div class="status branch_none">
	                <span class="cnt review">리뷰 수</span>
	                <span class="cnt favorite">관심 레스토랑 수</span>
	              </div>
            	</header>
			</section>
		</div>
	</div>
	</div>
            <section class="restaurant_introduce_section_mobile only-mobile">
              <div class="RestaurantIntroduceSection">
  

    <div class="RestaurantIntroduceSection__Section CardSlider EatDealFadeSliderSection">
  <div class="SectionLabel SectionLabel--Mint">
    <h3 class="SectionLabel__Label">프로모션</h3>
  </div>

  <div class="EatDealFadeSliderSection__Content">
    <section class="EatDealIntroduce">
      <i class="EatDealIntroduce__SignatureIcon"></i>
      <h3 class="EatDealIntroduce__Title">식당1 프로모션</h3>
      <p class="EatDealIntroduce__Description">
        할인된 가격으로<br />인기 메뉴를<br />맛볼 수 있는 기회!
      </p>
    </section>
	</div>
	</div>
	</div>
	</section>
            <!-- 상세 정보 -->
            <table class="info
              no_menu
              ">
              <caption>레스토랑 상세 정보</caption>

              <tbody>
                <tr class="only-desktop">
                  <th>주소</th>
                  <td>서울특별시 성동구 상원2길 1 B1
                  </td>
                </tr>

                <tr class="only-desktop">
                  <th>전화번호</th>
                  <td>02-468-5141</td>
                </tr>

                <tr>
                  <th>음식 종류</th>
                  <td>
                    <span>카페</span>
                  </td>
                </tr>

                <tr>
                  <th>주차</th>
                  <td>주차공간없음 </td>
                </tr>

                <tr>
                  <th style="vertical-align:top;">영업시간</th>
                  <td>11:00 - 15:00</td>
                </tr>

                <tr>
                  <th>휴일</th>
                  <td>화</td>
                </tr>


                <tr>
                  <th>메뉴</th>
                  <td class="menu_td">
                    <ul class="Restaurant_MenuList">
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">하브동 (S)</span>
                            <span class="Restaurant_MenuPrice">16,000원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">네기도로동</span>
                            <span class="Restaurant_MenuPrice">13,500원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">육회동 (S)</span>
                            <span class="Restaurant_MenuPrice">10,500원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">데카동</span>
                            <span class="Restaurant_MenuPrice">10,500원</span>
                        </li>
                        <li class="Restaurant_MenuItem">
                          <span class="Restaurant_Menu">도로도로동 (S)</span>
                            <span class="Restaurant_MenuPrice">26,000원</span>
                        </li>
                    </ul>
                  </td>
                </tr>

              </tbody>
            </table>
 <script id="reviewCountInfo" type="application/json">[{"action_value":1,"count":2},{"action_value":2,"count":3},{"action_value":3,"count":21}]</script>
          <section class="RestaurantReviewList">

            <ul class="RestaurantReviewList__ReviewList RestaurantReviewList__ReviewList--Loading">
				<li>
				<img src="/upload/img1.jsp">
				<textarea>후기 내용</textarea>
				</li>
            </ul>

            <div class="RestaurantReviewList__Empty">
              <span class="RestaurantReviewList__EmptyTitle">아직 작성된 리뷰가 없네요.</span>
              <span class="RestaurantReviewList__EmptyDescription">앱에서 해당 식당의 첫 리뷰를 작성해주시겠어요?</span>
               <button class="review_writing_button" data-restaurant_key="uxjkniX9gR7V">
                    <i class="review_writing_button_icon"></i>
                    <span class="review_writing_button_text">리뷰쓰기</span>
                  </button>
            </div>

            <div class="RestaurantReviewList__MoreReviewButton RestaurantReviewList__MoreReviewButton--Hide" role="button">
              더보기
            </div>
          </section>
  <!-- 데스크탑 사이드 영역 -->
      <div class="side-wrap">
        <div class="column-side">
          <!-- 지도 -->
          <div class="map-container">
          </div>
         </div>
      </div>
</center>
