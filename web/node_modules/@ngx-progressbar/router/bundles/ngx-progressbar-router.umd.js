(function (global, factory) {
    typeof exports === 'object' && typeof module !== 'undefined' ? factory(exports, require('@angular/core'), require('@angular/router'), require('rxjs'), require('rxjs/operators'), require('@ngx-progressbar/core')) :
    typeof define === 'function' && define.amd ? define('@ngx-progressbar/router', ['exports', '@angular/core', '@angular/router', 'rxjs', 'rxjs/operators', '@ngx-progressbar/core'], factory) :
    (factory((global['ngx-progressbar'] = global['ngx-progressbar'] || {}, global['ngx-progressbar'].router = {}),global.ng.core,global.ng.router,global.rxjs,global.rxjs.operators,global.i1));
}(this, (function (exports,i0,i2,rxjs,operators,i1) { 'use strict';

    /**
     * @fileoverview added by tsickle
     * @suppress {checkTypes,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
     */
    /** @type {?} */
    var NG_PROGRESS_ROUTER_CONFIG = new i0.InjectionToken('ngProgressRouterConfig');

    /*! *****************************************************************************
    Copyright (c) Microsoft Corporation. All rights reserved.
    Licensed under the Apache License, Version 2.0 (the "License"); you may not use
    this file except in compliance with the License. You may obtain a copy of the
    License at http://www.apache.org/licenses/LICENSE-2.0

    THIS CODE IS PROVIDED ON AN *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION ANY IMPLIED
    WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR PURPOSE,
    MERCHANTABLITY OR NON-INFRINGEMENT.

    See the Apache Version 2.0 License for specific language governing permissions
    and limitations under the License.
    ***************************************************************************** */
    var __assign = Object.assign || function __assign(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s)
                if (Object.prototype.hasOwnProperty.call(s, p))
                    t[p] = s[p];
        }
        return t;
    };
    function __read(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m)
            return o;
        var i = m.call(o), r, ar = [], e;
        try {
            while ((n === void 0 || n-- > 0) && !(r = i.next()).done)
                ar.push(r.value);
        }
        catch (error) {
            e = { error: error };
        }
        finally {
            try {
                if (r && !r.done && (m = i["return"]))
                    m.call(i);
            }
            finally {
                if (e)
                    throw e.error;
            }
        }
        return ar;
    }
    function __spread() {
        for (var ar = [], i = 0; i < arguments.length; i++)
            ar = ar.concat(__read(arguments[i]));
        return ar;
    }

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
        events.map(( /**
         * @param {?} event
         * @return {?}
         */function (event) { return res = res || routerEvent instanceof event; }));
        return res;
    }
    var NgProgressRouter = /** @class */ (function () {
        function NgProgressRouter(progress, router, config) {
            var _this = this;
            this._config = {
                id: 'root',
                delay: 0,
                startEvents: [i2.NavigationStart],
                completeEvents: [i2.NavigationEnd, i2.NavigationCancel, i2.NavigationError]
            };
            this._config = config ? __assign({}, this._config, config) : this._config;
            /** @type {?} */
            var progressRef = progress.ref(this._config.id);
            /** @type {?} */
            var startProgress = rxjs.of({}).pipe(operators.tap(( /**
             * @return {?}
             */function () { return progressRef.start(); })));
            /** @type {?} */
            var completeProgress = rxjs.of({}).pipe(operators.delay(this._config.delay), operators.tap(( /**
             * @return {?}
             */function () { return progressRef.complete(); })));
            /** @type {?} */
            var filterEvents = __spread(this._config.startEvents, this._config.completeEvents);
            router.events.pipe(operators.filter(( /**
             * @param {?} event
             * @return {?}
             */function (event) { return eventExists(event, filterEvents); })), operators.switchMap(( /**
             * @param {?} event
             * @return {?}
             */function (event) { return eventExists(event, _this._config.startEvents) ? startProgress : completeProgress; }))).subscribe();
        }
        NgProgressRouter.decorators = [
            { type: i0.Injectable, args: [{
                        providedIn: 'root'
                    },] }
        ];
        /** @nocollapse */
        NgProgressRouter.ctorParameters = function () {
            return [
                { type: i1.NgProgress },
                { type: i2.Router },
                { type: undefined, decorators: [{ type: i0.Optional }, { type: i0.Inject, args: [NG_PROGRESS_ROUTER_CONFIG,] }] }
            ];
        };
        /** @nocollapse */ NgProgressRouter.ngInjectableDef = i0.defineInjectable({ factory: function NgProgressRouter_Factory() { return new NgProgressRouter(i0.inject(i1.NgProgress), i0.inject(i2.Router), i0.inject(NG_PROGRESS_ROUTER_CONFIG, 8)); }, token: NgProgressRouter, providedIn: "root" });
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
            { type: i0.NgModule, args: [{},] }
        ];
        /** @nocollapse */
        NgProgressRouterModule.ctorParameters = function () {
            return [
                { type: NgProgressRouter }
            ];
        };
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

    exports.NgProgressRouterModule = NgProgressRouterModule;
    exports.ɵc = NG_PROGRESS_ROUTER_CONFIG;
    exports.ɵa = NgProgressRouter;

    Object.defineProperty(exports, '__esModule', { value: true });

})));

//# sourceMappingURL=ngx-progressbar-router.umd.js.map