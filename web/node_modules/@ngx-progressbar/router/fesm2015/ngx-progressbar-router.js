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
const NG_PROGRESS_ROUTER_CONFIG = new InjectionToken('ngProgressRouterConfig');

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
    let res = false;
    events.map((/**
     * @param {?} event
     * @return {?}
     */
    (event) => res = res || routerEvent instanceof event));
    return res;
}
class NgProgressRouter {
    /**
     * @param {?} progress
     * @param {?} router
     * @param {?} config
     */
    constructor(progress, router, config) {
        this._config = {
            id: 'root',
            delay: 0,
            startEvents: [NavigationStart],
            completeEvents: [NavigationEnd, NavigationCancel, NavigationError]
        };
        this._config = config ? Object.assign({}, this._config, config) : this._config;
        /** @type {?} */
        const progressRef = progress.ref(this._config.id);
        /** @type {?} */
        const startProgress = of({}).pipe(tap((/**
         * @return {?}
         */
        () => progressRef.start())));
        /** @type {?} */
        const completeProgress = of({}).pipe(delay(this._config.delay), tap((/**
         * @return {?}
         */
        () => progressRef.complete())));
        /** @type {?} */
        const filterEvents = [...this._config.startEvents, ...this._config.completeEvents];
        router.events.pipe(filter((/**
         * @param {?} event
         * @return {?}
         */
        (event) => eventExists(event, filterEvents))), switchMap((/**
         * @param {?} event
         * @return {?}
         */
        (event) => eventExists(event, this._config.startEvents) ? startProgress : completeProgress))).subscribe();
    }
}
NgProgressRouter.decorators = [
    { type: Injectable, args: [{
                providedIn: 'root'
            },] }
];
/** @nocollapse */
NgProgressRouter.ctorParameters = () => [
    { type: NgProgress },
    { type: Router },
    { type: undefined, decorators: [{ type: Optional }, { type: Inject, args: [NG_PROGRESS_ROUTER_CONFIG,] }] }
];
/** @nocollapse */ NgProgressRouter.ngInjectableDef = defineInjectable({ factory: function NgProgressRouter_Factory() { return new NgProgressRouter(inject(NgProgress), inject(Router), inject(NG_PROGRESS_ROUTER_CONFIG, 8)); }, token: NgProgressRouter, providedIn: "root" });

/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
class NgProgressRouterModule {
    // Inject the service to activate it
    /**
     * @param {?} ngProgressRouter
     */
    constructor(ngProgressRouter) {
    }
    /**
     * @param {?} config
     * @return {?}
     */
    static withConfig(config) {
        return {
            ngModule: NgProgressRouterModule,
            providers: [
                { provide: NG_PROGRESS_ROUTER_CONFIG, useValue: config }
            ]
        };
    }
}
NgProgressRouterModule.decorators = [
    { type: NgModule, args: [{},] }
];
/** @nocollapse */
NgProgressRouterModule.ctorParameters = () => [
    { type: NgProgressRouter }
];

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