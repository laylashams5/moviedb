import { __assign, __spread } from 'tslib';
import { InjectionToken, Injectable, Optional, Inject, NgModule, defineInjectable, inject } from '@angular/core';
import { Router, NavigationStart, NavigationEnd, NavigationCancel, NavigationError } from '@angular/router';
import { of } from 'rxjs';
import { tap, delay, switchMap, filter } from 'rxjs/operators';
import { NgProgress } from '@ngx-progressbar/core';

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
/** @type {?} */
var NG_PROGRESS_ROUTER_CONFIG = new InjectionToken('ngProgressRouterConfig');

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
/**
 * Check if a router event type exists in an array of router event types
 * @param {?} routerEvent
 * @param {?} events
 * @return {?}
 */
function eventExists(routerEvent, events) {
    /** @type {?} */
    var res = false;
    events.map((/**
     * @param {?} event
     * @return {?}
     */
    function (event) { return res = res || routerEvent instanceof event; }));
    return res;
}
var NgProgressRouter = /** @class */ (function () {
    function NgProgressRouter(progress, router, config) {
        var _this = this;
        this._config = {
            id: 'root',
            delay: 0,
            startEvents: [NavigationStart],
            completeEvents: [NavigationEnd, NavigationCancel, NavigationError]
        };
        this._config = config ? __assign({}, this._config, config) : this._config;
        /** @type {?} */
        var progressRef = progress.ref(this._config.id);
        /** @type {?} */
        var startProgress = of({}).pipe(tap((/**
         * @return {?}
         */
        function () { return progressRef.start(); })));
        /** @type {?} */
        var completeProgress = of({}).pipe(delay(this._config.delay), tap((/**
         * @return {?}
         */
        function () { return progressRef.complete(); })));
        /** @type {?} */
        var filterEvents = __spread(this._config.startEvents, this._config.completeEvents);
        router.events.pipe(filter((/**
         * @param {?} event
         * @return {?}
         */
        function (event) { return eventExists(event, filterEvents); })), switchMap((/**
         * @param {?} event
         * @return {?}
         */
        function (event) { return eventExists(event, _this._config.startEvents) ? startProgress : completeProgress; }))).subscribe();
    }
    NgProgressRouter.decorators = [
        { type: Injectable, args: [{
                    providedIn: 'root'
                },] }
    ];
    /** @nocollapse */
    NgProgressRouter.ctorParameters = function () { return [
        { type: NgProgress },
        { type: Router },
        { type: undefined, decorators: [{ type: Optional }, { type: Inject, args: [NG_PROGRESS_ROUTER_CONFIG,] }] }
    ]; };
    /** @nocollapse */ NgProgressRouter.ngInjectableDef = defineInjectable({ factory: function NgProgressRouter_Factory() { return new NgProgressRouter(inject(NgProgress), inject(Router), inject(NG_PROGRESS_ROUTER_CONFIG, 8)); }, token: NgProgressRouter, providedIn: "root" });
    return NgProgressRouter;
}());

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
var NgProgressRouterModule = /** @class */ (function () {
    // Inject the service to activate it
    function NgProgressRouterModule(ngProgressRouter) {
    }
    /**
     * @param {?} config
     * @return {?}
     */
    NgProgressRouterModule.withConfig = /**
     * @param {?} config
     * @return {?}
     */
    function (config) {
        return {
            ngModule: NgProgressRouterModule,
            providers: [
                { provide: NG_PROGRESS_ROUTER_CONFIG, useValue: config }
            ]
        };
    };
    NgProgressRouterModule.decorators = [
        { type: NgModule, args: [{},] }
    ];
    /** @nocollapse */
    NgProgressRouterModule.ctorParameters = function () { return [
        { type: NgProgressRouter }
    ]; };
    return NgProgressRouterModule;
}());

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */

export { NgProgressRouterModule, NG_PROGRESS_ROUTER_CONFIG as ɵc, NgProgressRouter as ɵa };

//# sourceMappingURL=ngx-progressbar-router.js.map