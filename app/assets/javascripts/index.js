(function ($) {
    'use strict';
    $(function () {

        var HIDDEN = 'hidden';
        var POPUP_FADEIN = 190;
        var POPUP_FADEOUT = 120;
        var CHECKBOX_TPL = '<span class="box"><i class="fa fa-check-square-o"></i><i class="fa fa-square-o"></i></span>';

        var mainBlock = $('main');
        var footer = $('footer');
        var pageBlind = $('#page-blind');
        var toplinePopovers = $('#topline-popovers');
        var toplinePopupAuth = $('#topline-popup-auth');
        var authFormSelect = toplinePopupAuth.find('.form-select');
        var toplinePopupCart = $('#topline-popup-cart');
        var toplinePopupFavorites = $('#topline-popup-favorites');
        var symbolMinus = $('.symbol-minus');
        var symbolPlus = $('.symbol-plus');
        var mainHorMenu = $('#main-horizontal-menu');
        var catalogMenuHover = $('#catalog-menu-hover');
        var fadedUnderCatalog = mainBlock.children('.centered-info').children('article').add(footer);
        var cartPopup = $('#cart-popup');

        var focusResetted = function () {
            toplinePopupAuth.find('form').trigger('reset');
            toplinePopupAuth.removeClass(HIDDEN).find('input:visible:first').focus();
        };

        var authSwitchTo = function (targetSelector) {
            if (targetSelector) {
                authFormSelect.addClass(HIDDEN);
                $(targetSelector).removeClass(HIDDEN);
                focusResetted();
            }
        };

        var hideToplinePopup = function (selector) {
            selector.fadeOut(POPUP_FADEOUT, function () {
                $(this).addClass(HIDDEN);
            });
        };

        var checkRadio = function (holderSelector) {
            var radioLabel = $(holderSelector).find('.check-radio');
            radioLabel.each(function () {
                $(this).prepend(CHECKBOX_TPL);
                if ($(this).children('input').is(':checked')) {
                    $(this).addClass('checked');
                }
            });
            radioLabel.children('input').on('click', function () {
                var name = $(this).attr('name');
                var label = $(this).parent();
                if ($(this).is(':checked')) {
                    label.addClass('checked');
                }
                label.parent().find('input[name="' + name + '"]').not($(this)).each(function () {
                    $(this).parent().removeClass('checked');
                });
            });
        };

        $('.scroller-main').unslider({
            animation: 'fade',
            autoplay: true,
            delay: 8000,
            speed: 2000,
            arrows: {
                prev: '<a class="unslider-arrow prev"><i class="fa fa-chevron-left"></i></a>',
                next: '<a class="unslider-arrow next"><i class="fa fa-chevron-right"></i></a>'
            }
        });

        $('.product .slider').unslider({
            speed: 0,
            keys: false,
            nav: false,
            arrows: false
        });

        checkRadio($(document));

        //-------------------------------------------------------------------------------------------------------------

        $(document)
                .on('click', '.color-controls > div', function () {
                    $(this).addClass('active').siblings().removeClass('active');
                    $(this).closest('.product').find('.slider').data('unslider').animate($(this).index());
                })
                .on('click', '.close-button', function () {
                    $(this).closest('.closing-container').fadeOut(POPUP_FADEOUT);
                })
                .on('click', '.checkbox', function () {
                    var input = $(this).children('input');
                    if (input.prop('checked')) {
                        $(this).removeClass('checked');
                        input.prop('checked', false);
                    } else {
                        $(this).addClass('checked');
                        input.prop('checked', true);
                    }
                })
                .on('click', '.switch-btn', function () {
                    $(this).addClass('active').siblings().removeClass('active');
                });

        $(document)
                .on('click', '.dropdown > input, .dropdown > i', function () {
                    $(this).blur().siblings('ul').fadeIn(POPUP_FADEIN);
                })
                .on('mouseleave', '.dropdown > ul', function () {
                    $(this).fadeOut(POPUP_FADEOUT);
                })
                .on('click', '.dropdown li', function () {
                    $(this).closest('.dropdown').children('input').val($(this).data('value') || $(this).text());
                    $(this).parent().fadeOut(POPUP_FADEOUT);
                });

        toplinePopovers.find('.favorites').on('click', function () {
            hideToplinePopup(toplinePopupCart);
            hideToplinePopup(toplinePopupAuth);
            if (toplinePopupFavorites.hasClass(HIDDEN)) {
                toplinePopupFavorites.fadeIn(POPUP_FADEIN, function () {
                    $(this).removeClass(HIDDEN);
                });
            } else {
                hideToplinePopup(toplinePopupFavorites);
            }
        });

        toplinePopovers.find('.cart')
                .on('mouseenter', function () {
                    hideToplinePopup(toplinePopupFavorites);
                    if (toplinePopupCart.hasClass(HIDDEN)) {
                        toplinePopupCart.fadeIn(POPUP_FADEIN);
                    }
                })
                .on('click', function () {
                    hideToplinePopup(toplinePopupCart);
                    hideToplinePopup(toplinePopupAuth);
                    pageBlind.css('display', 'flex').hide().fadeIn(POPUP_FADEIN);
                });

        toplinePopovers.find('.guest').on('click', function () {
            hideToplinePopup(toplinePopupFavorites);
            hideToplinePopup(toplinePopupCart);
            if (toplinePopupAuth.hasClass(HIDDEN)) {
                authFormSelect.addClass(HIDDEN);
                $('#auth-sign-in').removeClass(HIDDEN);
                toplinePopupAuth.fadeIn(POPUP_FADEIN, function () {
                    focusResetted();
                });
            } else {
                hideToplinePopup(toplinePopupAuth);
            }
        });

        toplinePopupCart.on('mouseleave', function () {
            hideToplinePopup(toplinePopupCart);
        });

        toplinePopupAuth.find('.like-link').on('click', function () {
            authSwitchTo($(this).data('selector'));
        });

        symbolMinus.on('click', function () {
            var input = $(this).siblings('input');
            var num = input.val() - 0;
            input.val(num > 0 ? (num - 1) : 0);
        });

        symbolPlus.on('click', function () {
            var input = $(this).siblings('input');
            var num = input.val() - 0;
            input.val(num + 1);
        });

        mainHorMenu.find('.catalog').add('#catalog-menu').on('mouseenter', function () {
            catalogMenuHover.fadeIn(POPUP_FADEIN);
            fadedUnderCatalog.addClass('opacity-2');
        });

        catalogMenuHover.on('mouseleave', function () {
            catalogMenuHover.fadeOut(POPUP_FADEOUT);
            fadedUnderCatalog.removeClass('opacity-2');
        });

    });
}(window.jQuery));