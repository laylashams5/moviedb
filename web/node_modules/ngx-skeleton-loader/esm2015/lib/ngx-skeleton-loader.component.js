/**
 * @fileoverview added by tsickle
 * Generated from: lib/ngx-skeleton-loader.component.ts
 * @suppress {checkTypes,constantProperty,extraRequire,missingOverride,missingReturn,unusedPrivateMembers,uselessCode} checked by tsc
 */
import { Component, Input, isDevMode, ChangeDetectionStrategy, Optional, Inject, } from '@angular/core';
import { start, end } from 'perf-marks/marks';
import { NGX_SKELETON_LOADER_CONFIG, } from './ngx-skeleton-loader-config.types';
export class NgxSkeletonLoaderComponent {
    /**
     * @param {?=} config
     */
    constructor(config) {
        const { appearance = 'line', animation = 'progress', theme = null, loadingText = 'Loading...', count = 1, ariaLabel = 'loading', } = config || {};
        this.appearance = appearance;
        this.animation = animation;
        this.theme = theme;
        this.loadingText = loadingText;
        this.count = count;
        this.items = [];
        this.ariaLabel = ariaLabel;
    }
    /**
     * @return {?}
     */
    ngOnInit() {
        start('NgxSkeletonLoader:Rendered');
        start('NgxSkeletonLoader:Loaded');
        this.validateInputValues();
    }
    /**
     * @private
     * @return {?}
     */
    validateInputValues() {
        // Checking if it's receiving a numeric value (string having ONLY numbers or if it's a number)
        if (!/^\d+$/.test(`${this.count}`)) {
            // Shows error message only in Development
            if (isDevMode()) {
                console.error(`\`NgxSkeletonLoaderComponent\` need to receive 'count' a numeric value. Forcing default to "1".`);
            }
            this.count = 1;
        }
        this.items.length = this.count;
        /** @type {?} */
        const allowedAnimations = ['progress', 'progress-dark', 'pulse', 'false'];
        if (allowedAnimations.indexOf(String(this.animation)) === -1) {
            // Shows error message only in Development
            if (isDevMode()) {
                console.error(`\`NgxSkeletonLoaderComponent\` need to receive 'animation' as: ${allowedAnimations.join(', ')}. Forcing default to "progress".`);
            }
            this.animation = 'progress';
        }
        if (['circle', 'line', ''].indexOf(String(this.appearance)) === -1) {
            // Shows error message only in Development
            if (isDevMode()) {
                console.error(`\`NgxSkeletonLoaderComponent\` need to receive 'appearance' as: circle or line or empty string. Forcing default to "''".`);
            }
            this.appearance = '';
        }
    }
    /**
     * @param {?} changes
     * @return {?}
     */
    ngOnChanges(changes) {
        // Avoiding multiple calls for the same input in case there's no changes in the fields
        // Checking if the fields that require validation are available and if they were changed
        // In case were not changed, we stop the function. Otherwise, `validateInputValues` will be called.
        if (['count', 'animation', 'appearance'].find((/**
         * @param {?} key
         * @return {?}
         */
        key => changes[key] && (changes[key].isFirstChange() || changes[key].previousValue === changes[key].currentValue)))) {
            return;
        }
        this.validateInputValues();
    }
    /**
     * @return {?}
     */
    ngAfterViewInit() {
        end('NgxSkeletonLoader:Rendered');
    }
    /**
     * @return {?}
     */
    ngOnDestroy() {
        end('NgxSkeletonLoader:Loaded');
    }
}
NgxSkeletonLoaderComponent.decorators = [
    { type: Component, args: [{
                selector: 'ngx-skeleton-loader',
                template: "<span\n  *ngFor=\"let item of items\"\n  class=\"loader\"\n  [attr.aria-label]=\"ariaLabel\"\n  aria-busy=\"true\"\n  aria-valuemin=\"0\"\n  aria-valuemax=\"100\"\n  [attr.aria-valuetext]=\"loadingText\"\n  role=\"progressbar\"\n  tabindex=\"0\"\n  [ngClass]=\"{\n    circle: appearance === 'circle',\n    progress: animation === 'progress',\n    'progress-dark': animation === 'progress-dark',\n    pulse: animation === 'pulse'\n  }\"\n  [ngStyle]=\"theme\"\n>\n</span>\n",
                changeDetection: ChangeDetectionStrategy.OnPush,
                styles: [".loader{background:#eff1f6 no-repeat;border-radius:4px;box-sizing:border-box;display:inline-block;height:20px;margin-bottom:10px;overflow:hidden;position:relative;width:100%;will-change:transform}.loader:after,.loader:before{box-sizing:border-box}.loader.circle{border-radius:50%;height:40px;margin:5px;width:40px}.loader.progress,.loader.progress-dark{transform:translateZ(0)}.loader.progress-dark:after,.loader.progress-dark:before,.loader.progress:after,.loader.progress:before{box-sizing:border-box}.loader.progress-dark:before,.loader.progress:before{-webkit-animation:progress 2s ease-in-out infinite;animation:progress 2s ease-in-out infinite;background-size:200px 100%;content:\"\";height:100%;left:0;position:absolute;top:0;width:200px;z-index:1}.loader.progress:before{background-image:linear-gradient(90deg,hsla(0,0%,100%,0),hsla(0,0%,100%,.6),hsla(0,0%,100%,0))}.loader.progress-dark:before{background-image:linear-gradient(90deg,transparent,rgba(0,0,0,.2),transparent)}.loader.pulse{-webkit-animation:pulse 1.5s cubic-bezier(.4,0,.2,1) infinite;-webkit-animation-delay:.5s;animation:pulse 1.5s cubic-bezier(.4,0,.2,1) infinite;animation-delay:.5s}@media (prefers-reduced-motion:reduce){.loader.progress,.loader.progress-dark,.loader.pulse{-webkit-animation:none;animation:none}.loader.progress,.loader.progress-dark{background-image:none}}@-webkit-keyframes progress{0%{transform:translate3d(-200px,0,0)}to{transform:translate3d(calc(200px + 100vw),0,0)}}@keyframes progress{0%{transform:translate3d(-200px,0,0)}to{transform:translate3d(calc(200px + 100vw),0,0)}}@-webkit-keyframes pulse{0%{opacity:1}50%{opacity:.4}to{opacity:1}}@keyframes pulse{0%{opacity:1}50%{opacity:.4}to{opacity:1}}"]
            }] }
];
/** @nocollapse */
NgxSkeletonLoaderComponent.ctorParameters = () => [
    { type: undefined, decorators: [{ type: Inject, args: [NGX_SKELETON_LOADER_CONFIG,] }, { type: Optional }] }
];
NgxSkeletonLoaderComponent.propDecorators = {
    count: [{ type: Input }],
    loadingText: [{ type: Input }],
    appearance: [{ type: Input }],
    animation: [{ type: Input }],
    ariaLabel: [{ type: Input }],
    theme: [{ type: Input }]
};
if (false) {
    /** @type {?} */
    NgxSkeletonLoaderComponent.ngAcceptInputType_count;
    /** @type {?} */
    NgxSkeletonLoaderComponent.ngAcceptInputType_animation;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.count;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.loadingText;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.appearance;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.animation;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.ariaLabel;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.theme;
    /** @type {?} */
    NgxSkeletonLoaderComponent.prototype.items;
}
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibmd4LXNrZWxldG9uLWxvYWRlci5jb21wb25lbnQuanMiLCJzb3VyY2VSb290IjoiL1VzZXJzL3dpbGxtZW5kZXNuZXRvL1Byb2plY3RzL25neC1za2VsZXRvbi1sb2FkZXIvcHJvamVjdHMvbmd4LXNrZWxldG9uLWxvYWRlci9zcmMvIiwic291cmNlcyI6WyJsaWIvbmd4LXNrZWxldG9uLWxvYWRlci5jb21wb25lbnQudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7QUFBQSxPQUFPLEVBQ0wsU0FBUyxFQUVULEtBQUssRUFDTCxTQUFTLEVBR1QsdUJBQXVCLEVBR3ZCLFFBQVEsRUFDUixNQUFNLEdBQ1AsTUFBTSxlQUFlLENBQUM7QUFDdkIsT0FBTyxFQUFFLEtBQUssRUFBRSxHQUFHLEVBQUUsTUFBTSxrQkFBa0IsQ0FBQztBQUM5QyxPQUFPLEVBR0wsMEJBQTBCLEdBQzNCLE1BQU0sb0NBQW9DLENBQUM7QUFRNUMsTUFBTSxPQUFPLDBCQUEwQjs7OztJQTJCckMsWUFBNEQsTUFBZ0M7Y0FDcEYsRUFDSixVQUFVLEdBQUcsTUFBTSxFQUNuQixTQUFTLEdBQUcsVUFBVSxFQUN0QixLQUFLLEdBQUcsSUFBSSxFQUNaLFdBQVcsR0FBRyxZQUFZLEVBQzFCLEtBQUssR0FBRyxDQUFDLEVBQ1QsU0FBUyxHQUFHLFNBQVMsR0FDdEIsR0FBRyxNQUFNLElBQUksRUFBRTtRQUVoQixJQUFJLENBQUMsVUFBVSxHQUFHLFVBQVUsQ0FBQztRQUM3QixJQUFJLENBQUMsU0FBUyxHQUFHLFNBQVMsQ0FBQztRQUMzQixJQUFJLENBQUMsS0FBSyxHQUFHLEtBQUssQ0FBQztRQUNuQixJQUFJLENBQUMsV0FBVyxHQUFHLFdBQVcsQ0FBQztRQUMvQixJQUFJLENBQUMsS0FBSyxHQUFHLEtBQUssQ0FBQztRQUNuQixJQUFJLENBQUMsS0FBSyxHQUFHLEVBQUUsQ0FBQztRQUNoQixJQUFJLENBQUMsU0FBUyxHQUFHLFNBQVMsQ0FBQztJQUM3QixDQUFDOzs7O0lBRUQsUUFB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biAgQ29tcG9uZW50LFxuICBPbkluaXQsXG4gIElucHV0LFxuICBpc0Rldk1vZGUsXG4gIE9uRGVzdHJveSxcbiAgQWZ0ZXJWaWV3SW5pdCxcbiAgQ2hhbmdlRGV0ZWN0aW9uU3RyYXRlZ3ksXG4gIE9uQ2hhbmdlcyxcbiAgU2ltcGxlQ2hhbmdlcyxcbiAgT3B0aW9uYWwsXG4gIEluamVjdCxcbn0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XG5pbXBvcnQgeyBzdGFydCwgZW5kIH0gZnJvbSAncGVyZi1tYXJrcy9tYXJrcyc7XG5pbXBvcnQge1xuICBOZ3hTa2VsZXRvbkxvYWRlckNvbmZpZyxcbiAgTmd4U2tlbGV0b25Mb2FkZXJDb25maWdUaGVtZSxcbiAgTkdYX1NLRUxFVE9OX0xPQURFUl9DT05GSUcsXG59IGZyb20gJy4vbmd4LXNrZWxldG9uLWxvYWRlci1jb25maWcudHlwZXMnO1xuXG5AQ29tcG9uZW50KHtcbiAgc2VsZWN0b3I6ICduZ3gtc2tlbGV0b24tbG9hZGVyJyxcbiAgdGVtcGxhdGVVcmw6ICcuL25neC1za2VsZXRvbi1sb2FkZXIuaHRtbCcsXG4gIHN0eWxlVXJsczogWycuL25neC1za2VsZXRvbi1sb2FkZXIuc2NzcyddLFxuICBjaGFuZ2VEZXRlY3Rpb246IENoYW5nZURldGVjdGlvblN0cmF0ZWd5Lk9uUHVzaCxcbn0pXG5leHBvcnQgY2xhc3MgTmd4U2tlbGV0b25Mb2FkZXJDb21wb25lbnQgaW1wbGVtZW50cyBPbkluaXQsIEFmdGVyVmlld0luaXQsIE9uRGVzdHJveSwgT25DaGFuZ2VzIHtcbiAgLy8gdHNsaW50OmRpc2FibGUtbmV4dC1saW5lOiB2YXJpYWJsZS1uYW1lXG4gIHN0YXRpYyBuZ0FjY2VwdElucHV0VHlwZV9jb3VudDogbnVtYmVyIHwgc3RyaW5nO1xuICAvLyB0c2xpbnQ6ZGlzYWJsZS1uZXh0LWxpbmU6IHZhcmlhYmxlLW5hbWVcbiAgc3RhdGljIG5nQWNjZXB0SW5wdXRUeXBlX2FuaW1hdGlvbjogYm9vbGVhbiB8IHN0cmluZztcblxuICBASW5wdXQoKVxuICBjb3VudDogTmd4U2tlbGV0b25Mb2FkZXJDb25maWdbJ2NvdW50J107XG5cbiAgQElucHV0KClcbiAgbG9hZGluZ1RleHQ6IE5neFNrZWxldG9uTG9hZGVyQ29uZmlnWydsb2FkaW5nVGV4dCddO1xuXG4gIEBJbnB1dCgpXG4gIGFwcGVhcmFuY2U6IE5neFNrZWxldG9uTG9hZGVyQ29uZmlnWydhcHBlYXJhbmNlJ107XG5cbiAgQElucHV0KClcbiAgYW5pbWF0aW9uOiBOZ3hTa2VsZXRvbkxvYWRlckNvbmZpZ1snYW5pbWF0aW9uJ107XG5cbiAgQElucHV0KClcbiAgYXJpYUxhYmVsOiBOZ3hTa2VsZXRvbkxvYWRlckNvbmZpZ1snYXJpYUxhYmVsJ107XG5cbiAgQElucHV0KClcbiAgdGhlbWU6IE5neFNrZWxldG9uTG9hZGVyQ29uZmlnVGhlbWU7XG5cbiAgLy8gdHNsaW50OmRpc2FibGUtbmV4dC1saW5lOiBuby1hbnlcbiAgaXRlbXM6IEFycmF5PGFueT47XG5cbiAgY29uc3RydWN0b3IoQEluamVjdChOR1hfU0tFTEVUT05fTE9BREVSX0NPTkZJRykgQE9wdGlvbmFsKCkgY29uZmlnPzogTmd4U2tlbGV0b25Mb2FkZXJDb25maWcpIHtcbiAgICBjb25zdCB7XG4gICAgICBhcHBlYXJhbmNlID0gJ2xpbmUnLFxuICAgICAgYW5pbWF0aW9uID0gJ3Byb2dyZXNzJyxcbiAgICAgIHRoZW1lID0gbnVsbCxcbiAgICAgIGxvYWRpbmdUZXh0ID0gJ0xvYWRpbmcuLi4nLFxuICAgICAgY291bnQgPSAxLFxuICAgICAgYXJpYUxhYmVsID0gJ2xvYWRpbmcnLFxuICAgIH0gPSBjb25maWcgfHwge307XG5cbiAgICB0aGlzLmFwcGVhcmFuY2UgPSBhcHBlYXJhbmNlO1xuICAgIHRoaXMuYW5pbWF0aW9uID0gYW5pbWF0aW9uO1xuICAgIHRoaXMudGhlbWUgPSB0aGVtZTtcbiAgICB0aGlzLmxvYWRpbmdUZXh0ID0gbG9hZGluZ1RleHQ7XG4gICAgdGhpcy5jb3VudCA9IGNvdW50O1xuICAgIHRoaXMuaXRlbXMgPSBbXTtcbiAgICB0aGlzLmFyaWFMYWJlbCA9IGFyaWFMYWJlbDtcbiAgfVxuXG4gIG5nT25Jbml0KCkge1xuICAgIHN0YXJ0KCdOZ3hTa2VsZXRvbkxvYWRlcjpSZW5kZXJlZCcpO1xuICAgIHN0YXJ0KCdOZ3hTa2VsZXRvbkxvYWRlcjpMb2FkZWQnKTtcblxuICAgIHRoaXMudmFsaWRhdGVJbnB1dFZhbHVlcygpO1xuICB9XG5cbiAgcHJpdmF0ZSB2YWxpZGF0ZUlucHV0VmFsdWVzKCkge1xuICAgIC8vIENoZWNraW5nIGlmIGl0J3MgcmVjZWl2aW5nIGEgbnVtZXJpYyB2YWx1ZSAoc3RyaW5nIGhhdmluZyBPTkxZIG51bWJlcnMgb3IgaWYgaXQncyBhIG51bWJlcilcbiAgICBpZiAoIS9eXFxkKyQvLnRlc3QoYCR7dGhpcy5jb3VudH1gKSkge1xuICAgICAgLy8gU2hvd3MgZXJyb3IgbWVzc2FnZSBvbmx5IGluIERldmVsb3BtZW50XG4gICAgICBpZiAoaXNEZXZNb2RlKCkpIHtcbiAgICAgICAgY29uc29sZS5lcnJvcihcbiAgICAgICAgICBgXFxgTmd4U2tlbGV0b25Mb2FkZXJDb21wb25lbnRcXGAgbmVlZCB0byByZWNlaXZlICdjb3VudCcgYSBudW1lcmljIHZhbHVlLiBGb3JjaW5nIGRlZmF1bHQgdG8gXCIxXCIuYCxcbiAgICAgICAgKTtcbiAgICAgIH1cbiAgICAgIHRoaXMuY291bnQgPSAxO1xuICAgIH1cbiAgICB0aGlzLml0ZW1zLmxlbmd0aCA9IHRoaXMuY291bnQ7XG5cbiAgICBjb25zdCBhbGxvd2VkQW5pbWF0aW9ucyA9IFsncHJvZ3Jlc3MnLCAncHJvZ3Jlc3MtZGFyaycsICdwdWxzZScsICdmYWxzZSddO1xuICAgIGlmIChhbGxvd2VkQW5pbWF0aW9ucy5pbmRleE9mKFN0cmluZyh0aGlzLmFuaW1hdGlvbikpID09PSAtMSkge1xuICAgICAgLy8gU2hvd3MgZXJyb3IgbWVzc2FnZSBvbmx5IGluIERldmVsb3BtZW50XG4gICAgICBpZiAoaXNEZXZNb2RlKCkpIHtcbiAgICAgICAgY29uc29sZS5lcnJvcihcbiAgICAgICAgICBgXFxgTmd4U2tlbGV0b25Mb2FkZXJDb21wb25lbnRcXGAgbmVlZCB0byByZWNlaXZlICdhbmltYXRpb24nIGFzOiAke2FsbG93ZWRBbmltYXRpb25zLmpvaW4oXG4gICAgICAgICAgICAnLCAnLFxuICAgICAgICAgICl9LiBGb3JjaW5nIGRlZmF1bHQgdG8gXCJwcm9ncmVzc1wiLmAsXG4gICAgICAgICk7XG4gICAgICB9XG4gICAgICB0aGlzLmFuaW1hdGlvbiA9ICdwcm9ncmVzcyc7XG4gICAgfVxuXG4gICAgaWYgKFsnY2lyY2xlJywgJ2xpbmUnLCAnJ10uaW5kZXhPZihTdHJpbmcodGhpcy5hcHBlYXJhbmNlKSkgPT09IC0xKSB7XG4gICAgICAvLyBTaG93cyBlcnJvciBtZXNzYWdlIG9ubHkgaW4gRGV2ZWxvcG1lbnRcbiAgICAgIGlmIChpc0Rldk1vZGUoKSkge1xuICAgICAgICBjb25zb2xlLmVycm9yKFxuICAgICAgICAgIGBcXGBOZ3hTa2VsZXRvbkxvYWRlckNvbXBvbmVudFxcYCBuZWVkIHRvIHJlY2VpdmUgJ2FwcGVhcmFuY2UnIGFzOiBjaXJjbGUgb3IgbGluZSBvciBlbXB0eSBzdHJpbmcuIEZvcmNpbmcgZGVmYXVsdCB0byBcIicnXCIuYCxcbiAgICAgICAgKTtcbiAgICAgIH1cbiAgICAgIHRoaXMuYXBwZWFyYW5jZSA9ICcnO1xuICAgIH1cbiAgfVxuXG4gIG5nT25DaGFuZ2VzKGNoYW5nZXM6IFNpbXBsZUNoYW5nZXMpIHtcbiAgICAvLyBBdm9pZGluZyBtdWx0aXBsZSBjYWxscyBmb3IgdGhlIHNhbWUgaW5wdXQgaW4gY2FzZSB0aGVyZSdzIG5vIGNoYW5nZXMgaW4gdGhlIGZpZWxkc1xuICAgIC8vIENoZWNraW5nIGlmIHRoZSBmaWVsZHMgdGhhdCByZXF1aXJlIHZhbGlkYXRpb24gYXJlIGF2YWlsYWJsZSBhbmQgaWYgdGhleSB3ZXJlIGNoYW5nZWRcbiAgICAvLyBJbiBjYXNlIHdlcmUgbm90IGNoYW5nZWQsIHdlIHN0b3AgdGhlIGZ1bmN0aW9uLiBPdGhlcndpc2UsIGB2YWxpZGF0ZUlucHV0VmFsdWVzYCB3aWxsIGJlIGNhbGxlZC5cbiAgICBpZiAoXG4gICAgICBbJ2NvdW50JywgJ2FuaW1hdGlvbicsICdhcHBlYXJhbmNlJ10uZmluZChcbiAgICAgICAga2V5ID0+XG4gICAgICAgICAgY2hhbmdlc1trZXldICYmIChjaGFuZ2VzW2tleV0uaXNGaXJzdENoYW5nZSgpIHx8IGNoYW5nZXNba2V5XS5wcmV2aW91c1ZhbHVlID09PSBjaGFuZ2VzW2tleV0uY3VycmVudFZhbHVlKSxcbiAgICAgIClcbiAgICApIHtcbiAgICAgIHJldHVybjtcbiAgICB9XG5cbiAgICB0aGlzLnZhbGlkYXRlSW5wdXRWYWx1ZXMoKTtcbiAgfVxuXG4gIG5nQWZ0ZXJWaWV3SW5pdCgpIHtcbiAgICBlbmQoJ05neFNrZWxldG9uTG9hZGVyOlJlbmRlcmVkJyk7XG4gIH1cblxuICBuZ09uRGVzdHJveSgpIHtcbiAgICBlbmQoJ05neFNrZWxldG9uTG9hZGVyOkxvYWRlZCcpO1xuICB9XG59XG4iXX0=