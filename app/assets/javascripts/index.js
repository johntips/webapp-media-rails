    function openGarraly(obj){


        var styles = getComputedStyle(obj);
        var id = String(obj.id);

        var openPhotoSwipe = function() {
        var pswpElement = document.querySelectorAll('.pswp')[0];

        // build items array
        var items =[]
        var hash = {};
        var styles = getComputedStyle(obj);
        var id = String(obj.id);

        //garraryに渡す、gararry番号、gararry内画像番号、gararry内画像番号配列、
        var gallerysCount = id.replace(/img(.+)-(.+)/,"$1");
        var galleryImgsCount = id.replace(/img(.+)-(.+)/,"$2");
        var setGoto = galleryImgsCount - 1;
        var garraryUrlArray = [];
        var length = obj.parentNode.children.length;
        //親クラスの特定、
        var garraryElements = obj.parentNode.children;


        //console.log(length);

        for(var i=0,l= length; i < l; i++) {
            // figureEl = galleryElements[i];
            // linkEl = figureEl.children[0];
            // size = linkEl.getAttribute("data-size").split("x");
            var tmpurl  = garraryElements[i].style.backgroundImage;
            var settitle =  garraryElements[i].innerText;
            //console.log(settitle);

            var seturl = tmpurl.replace(/^url\(|\)/g, "");
            //console.log(seturl);

            items.push({
                src: seturl,
                w: 1000,
                h: 1000,
                msrc: seturl,
                // el: figureEl,
                title: settitle
            });

        }


        console.log(items);
        var options = {
            showAnimationDuration: 300,
            hideAnimationDuration: 300,
            history: false,
            focus: false,
            index: setGoto
        };

        var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
        ///////////////////////////////////
            console.log("new photoswipe instance");
        ///////////////////////////////////
        gallery.init();
    };

    openPhotoSwipe();
    }

    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 'auto',
        coverflow: {
            rotate: 10,
            stretch: 20,
            depth: 190,
            modifier: 1,
            slideShadows : true
        }
    });