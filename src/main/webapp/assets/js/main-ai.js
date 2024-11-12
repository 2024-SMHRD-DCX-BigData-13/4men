document.addEventListener("DOMContentLoaded", function() {
	window.submitSelection = function() {
		const selectedOptions = Array.from(document.querySelectorAll('input[name="options"]:checked')).map(option => option.value);

		if (selectedOptions.length === 0) {
			alert("적어도 하나의 항목을 선택해주세요.");
			return;
		}

		// 체크리스트 숨기기
		document.getElementById('check-con').style.display = 'none';
		document.getElementById('map').style.display = 'block';
		const mapContainer = document.getElementById('map');
		mapContainer.style.width = document.getElementById('rec-container').clientWidth + 'px';
		mapContainer.style.height = (document.getElementById('rec-container').clientHeight + 230) + 'px';

		// 지도 생성 및 초기화
		const mapOptions = {
			center: new naver.maps.LatLng(37.5665, 126.9780), // 서울 중심 좌표
			zoom: 10
		};

		const map = new naver.maps.Map('map', mapOptions);

		// 임시 명소 데이터 (카테고리별 사진 찍기 좋은 명소 좌표)
		const locations = {
			도시: [
				{ name: "서울 남산타워", lat: 37.5512, lng: 126.9882, info: "서울의 대표적인 랜드마크로, 아름다운 야경을 감상할 수 있습니다." },
				{ name: "동대문 디자인 플라자", lat: 37.567, lng: 127.009, info: "미래지향적인 건축물과 다양한 전시가 열리는 서울의 명소입니다." },
				{ name: "서울숲", lat: 37.5444, lng: 127.0371, info: "서울 도심 속에서 자연을 느낄 수 있는 공원입니다." },
				{ name: "명동 거리", lat: 37.5636, lng: 126.982, info: "쇼핑과 다양한 먹거리를 즐길 수 있는 서울의 번화가입니다." },
				{ name: "이태원", lat: 37.5345, lng: 126.994, info: "다양한 문화와 외국인들이 모이는 국제적인 거리입니다." }
			],
			산: [
				{ name: "설악산 국립공원", lat: 38.1195, lng: 128.4656, info: "한국에서 가장 아름다운 산 중 하나로, 사계절 내내 멋진 풍경을 제공합니다." },
				{ name: "한라산", lat: 33.3617, lng: 126.5292, info: "제주의 중심에 위치한 산으로, 한라산 정상에서의 경치가 일품입니다." },
				{ name: "북한산", lat: 37.6583, lng: 126.9889, info: "서울 근교에서 등산을 즐기기 좋은 산입니다." },
				{ name: "지리산", lat: 35.3216, lng: 127.7305, info: "한국의 대표적인 명산 중 하나로, 다양한 트래킹 코스를 제공합니다." },
				{ name: "도봉산", lat: 37.6913, lng: 127.0464, info: "도시 근처에서 자연을 즐길 수 있는 인기 등산지입니다." }
			],
			바다: [
				{ name: "해운대 해수욕장", lat: 35.1587, lng: 129.1603, info: "부산에서 가장 유명한 해변으로, 해수욕과 다양한 해양 활동을 즐길 수 있습니다." },
				{ name: "속초 해변", lat: 38.207, lng: 128.591, info: "깨끗한 모래와 맑은 바다를 자랑하는 동해안의 해변입니다." },
				{ name: "제주 함덕 해수욕장", lat: 33.5431, lng: 126.6724, info: "제주도에서 가장 인기 있는 해변 중 하나로, 아름다운 경치를 제공합니다." },
				{ name: "광안리 해수욕장", lat: 35.1539, lng: 129.1184, info: "부산의 대표적인 해변으로, 광안대교와 함께 아름다운 야경을 즐길 수 있습니다." },
				{ name: "정동진 해변", lat: 37.6897, lng: 129.0343, info: "해돋이 명소로 유명한 동해안의 아름다운 해변입니다." }
			],
			역사: [
				{ name: "경복궁", lat: 37.5796, lng: 126.977, info: "조선 시대의 대표 궁궐로, 한국의 전통 건축을 감상할 수 있는 곳입니다." },
				{ name: "창덕궁", lat: 37.5826, lng: 126.991, info: "자연과 조화된 아름다운 궁궐로, 세계문화유산에 등재되어 있습니다." },
				{ name: "수원 화성", lat: 37.2862, lng: 127.0095, info: "조선 시대의 성곽으로, 역사적 가치가 높은 유적지입니다." },
				{ name: "안동 하회마을", lat: 36.5382, lng: 128.5186, info: "한국 전통 가옥이 잘 보존된 마을로, 유네스코 세계문화유산에 등재되어 있습니다." },
				{ name: "종묘", lat: 37.5744, lng: 126.9911, info: "조선 왕조의 역사를 느낄 수 있는 한국의 전통 제례 장소입니다." }
			]
		};

		// 선택된 카테고리 결정 및 명소 추천
		const categoryCount = { 도시: 0, 산: 0, 바다: 0, 역사: 0 };
		selectedOptions.forEach(option => {
			if (['야경', '시장', '건축물', '감성적인카페', '골목길'].includes(option)) {
				categoryCount.도시++;
			} else if (['전망', '숲', '계곡', '야생화', '자연 풍경'].includes(option)) {
				categoryCount.산++;
			} else if (['일출일몰', '해변', '파도', '선박', '항구'].includes(option)) {
				categoryCount.바다++;
			} else if (['유적지', '역사적인건물', '전통의상', '문화', '박물관'].includes(option)) {
				categoryCount.역사++;
			}
		});

		const recommendedCategory = Object.keys(categoryCount).reduce((a, b) => categoryCount[a] > categoryCount[b] ? a : b);

		// 추천된 카테고리에서 랜덤으로 하나의 명소 선택
		const randomIndex = Math.floor(Math.random() * locations[recommendedCategory].length);
		const selectedLocation = locations[recommendedCategory][randomIndex];

		// 지도에 추천된 명소 표시 및 정보창 열기
		const marker = new naver.maps.Marker({
			position: new naver.maps.LatLng(selectedLocation.lat, selectedLocation.lng),
			map: map,
			title: selectedLocation.name
		});

		const infoWindow = new naver.maps.InfoWindow({
			content: `
                <div class="infoWindow-content" style="width:200px;text-align:center;padding:10px;">
                    <strong>${selectedLocation.name}</strong><br>
                    ${selectedLocation.info}<br>
                    <a href="https://www.google.com/search?q=${encodeURIComponent(selectedLocation.name)+" 사진 찍기 좋은 곳"}" target="_blank">▶검색해보기◀</a>
                </div>
            `,
			borderWidth: 0,
			disableAnchor: true,
			backgroundColor: 'transparent',

			disableAutoPan: false
		});


		naver.maps.Event.addListener(marker, 'click', function() {
			infoWindow.open(map, marker);
		});

		// 지도 중심 위치를 추천된 명소로 설정 및 줌 레벨을 높게 설정
		map.setCenter(new naver.maps.LatLng(selectedLocation.lat, selectedLocation.lng));
		map.setZoom(14); // 줌 레벨을 높게 설정하여 명소가 더 강조되도록 설정

		// 지도 로드 후 바로 정보창 열기
		infoWindow.open(map, marker);
	};
});


