require! {
  \./package.json : {options}
}

module.exports = do
  furute: {}
  purge: {
    +enabled
    -preserve-html-elements
    layers: <[base components utilities]>
    content:
      * options.paths.view + "/index.html"
      * options.paths.js + "/main.js"

    /* These options are passed through directly to PurgeCSS */
    options:
      whitelist: [
        ### LAYOUT - Container (force using)
        #\container

        ### LAYOUT - Box Sizing
        #\box-border
        #\box-content

        ### LAYOUT - Display
        #\block
        #\inline-block
        #\inline
        #\flex
        #\inline-flex
        #\table
        #\table-caption
        #\table-cell
        #\table-column
        #\table-column-group
        #\table-footer-group
        #\table-header-group
        #\table-row-group
        #\table-row
        #\flow-root
        #\grid
        #\inline-grid
        #\contents
        #\hidden

        ### LAYOUT - Floats
        #\float-right
        #\float-left
        #\float-none
        #\clearfix

        ### LAYOUT - Clear
        #\clear-left
        #\clear-right
        #\clear-both
        #\clear-none

        ### LAYOUT - Object Fit
        #\object-contain
        #\object-cover
        #\object-fill
        #\object-none
        #\object-scale-down

        ### LAYOUT - Object Position
        #\object-bottom
        #\object-center
        #\object-left
        #\object-left-bottom
        #\object-left-top
        #\object-right
        #\object-right-bottom
        #\object-right-top
        #\object-top

        ### LAYOUT - Overflow
        #\overflow-auto
        #\overflow-hidden
        #\overflow-visible
        #\overlow-scroll
        #\overflow-x-auto
        #\overflow-y-auto
        #\overflow-x-hidden
        #\overflow-y-hidden
        #\overflow-x-visible
        #\overflow-y-visible
        #\overflow-x-scroll
        #\overflow-y-scroll
        #\scrollgin-touch
        #\scrolling-auto

        ### LAYOUT - Overscroll Behavior
        #\overscroll-auto
        #\overscroll-contain
        #\overscroll-none
        #\overscroll-y-auto
        #\overscroll-y-contain
        #\overscroll-y-none
        #\overscroll-x-auto
        #\overscroll-x-contain
        #\overscroll-x-none

        ### LAYOUT - Position
        #\static
        #\fixed
        #\absolute
        #\relative
        #\sticky

        ### LAYOUT - Top / Right /Bottom /Left
        #\inset-0
        #\inset-auto
        #\inset-y-0
        #\inset-x-0
        #\inset-y-auto
        #\inset-x-auto
        #\top-0
        #\right-0
        #\bottom-0
        #\left-0
        #\top-auto
        #\right-auto
        #\bottom-auto
        #\left-auto

        ### LAYOUT - Visibility
        #\visible
        #\invisible

        ### LAYOUT - Z-Index
        #\z-0
        #\z-10
        #\z-20
        #\z-30
        #\z-40
        #\z-50
        #\z-auto

        ### FLEXBOX - Flex Direction
        #\flex-row
        #\flex-row-reverse
        #\flex-col
        #\flex-col-reverse

        ### FLEXBOX - Flex Wrap
        #\flex-wrap
        #\flex-wrap-reverse
        #\flex-no-wrap

        ### FLEXBOX - Flex
        #\flex-1
        #\flex-auto
        #\flex-initial
        #\flex-none

        ### FLEXBOX - Flex Grow
        #\flex-grow-0
        #\flex-grow

        ### FLEXBOX - Flex Shrink
        #\flex-shrink-0
        #\flex-shrink

        ### FLEXBOX - Order
        #\order-1
        #\order-2
        #\order-3
        #\order-4
        #\order-5
        #\order-6
        #\order-7
        #\order-8
        #\order-9
        #\order-10
        #\order-11
        #\order-12
        #\order-first
        #\order-last
        #\order-none

        ### Grid - Grid Template Columns
        #\grid-cols-1
        #\grid-cols-2
        #\grid-cols-3
        #\grid-cols-4
        #\grid-cols-5
        #\grid-cols-6
        #\grid-cols-7
        #\grid-cols-8
        #\grid-cols-9
        #\grid-cols-10
        #\grid-cols-11
        #\grid-cols-12
        #\grid-cols-none

        ### Grid - Grid Column Start / End
        #\col-auto
        #\col-span-1
        #\col-span-2
        #\col-span-3
        #\col-span-4
        #\col-span-5
        #\col-span-6
        #\col-span-7
        #\col-span-8
        #\col-span-9
        #\col-span-10
        #\col-span-11
        #\col-span-12
        #\col-start-1
        #\col-start-2
        #\col-start-3
        #\col-start-4
        #\col-start-5
        #\col-start-6
        #\col-start-7
        #\col-start-8
        #\col-start-9
        #\col-start-10
        #\col-start-11
        #\col-start-12
        #\col-start-13
        #\col-start-auto
        #\col-end-1
        #\col-end-2
        #\col-end-3
        #\col-end-4
        #\col-end-5
        #\col-end-6
        #\col-end-7
        #\col-end-8
        #\col-end-9
        #\col-end-10
        #\col-end-11
        #\col-end-12
        #\col-end-13
        #\col-end-auto

        ### Grid - Grid Template Rows
        #\grid-rows-1
        #\grid-rows-2
        #\grid-rows-3
        #\grid-rows-4
        #\grid-rows-5
        #\grid-rows-6
        #\grid-rows-none

        ### Grid - Grid Row Start / End
        #\row-auto
        #\row-span-1
        #\row-span-2
        #\row-span-3
        #\row-span-4
        #\row-span-5
        #\row-span-6
        #\row-start-1
        #\row-start-2
        #\row-start-3
        #\row-start-4
        #\row-start-5
        #\row-start-6
        #\row-start-7
        #\row-start-auto
        #\row-end-1
        #\row-end-2
        #\row-end-3
        #\row-end-4
        #\row-end-5
        #\row-end-6
        #\row-end-7
        #\row-end-auto

        ### Grid - Grid Auto Flow
        #\grid-flow-row
        #\grid-flow-col
        #\grid-flow-row-dense
        #\grid-flow-col-dense

        ### Grid - Gap
        #\gap-0
        #\gap-1
        #\gap-2
        #\gap-3
        #\gap-4
        #\gap-5
        #\gap-6
        #\gap-8
        #\gap-10
        #\gap-12
        #\gap-16
        #\gap-20
        #\gap-24
        #\gap-32
        #\gap-40
        #\gap-48
        #\gap-56
        #\gap-64
        #\gap-px
        #\gap-x-0
        #\gap-x-1
        #\gap-x-2
        #\gap-x-3
        #\gap-x-4
        #\gap-x-5
        #\gap-x-6
        #\gap-x-8
        #\gap-x-10
        #\gap-x-12
        #\gap-x-16
        #\gap-x-20
        #\gap-x-24
        #\gap-x-32
        #\gap-x-40
        #\gap-x-48
        #\gap-x-56
        #\gap-x-64
        #\gap-x-px
        #\gap-y-1
        #\gap-y-2
        #\gap-y-3
        #\gap-y-4
        #\gap-y-5
        #\gap-y-6
        #\gap-y-8
        #\gap-y-10
        #\gap-y-12
        #\gap-y-16
        #\gap-y-20
        #\gap-y-24
        #\gap-y-32
        #\gap-y-40
        #\gap-y-48
        #\gap-y-56
        #\gap-y-64
        #\gap-y-px

        ### BOX ALIGNMENT - Justify Content
        #\justify-start
        #\justify-end
        #\justify-center
        #\justify-between
        #\justify-around
        #\justify-evenly

        ### BOX ALIGNMENT - Justify Items
        #\justify-items-auto
        #\justify-items-start
        #\justify-items-end
        #\justify-items-center
        #\justify-items-stretch

        ### BOX ALIGNMENT - Justify Self
        #\justify-self-auto
        #\justify-self-start
        #\justify-self-end
        #\justify-self-center
        #\justify-self-stretch

        ### BOX ALIGNMENT - Align Content
        #\content-center
        #\content-start
        #\content-end
        #\content-between
        #\content-around
        #\content-evenly

        ### BOX ALIGNMENT - Align Items
        #\items-start
        #\items-end
        #\items-center
        #\items-baseline
        #\items-stretch

        ### BOX ALIGNMENT - Align Self
        #\self-auto
        #\self-start
        #\self-end
        #\self-center
        #\self-stretch

        ### BOX ALIGNMENT - Place Content
        #\place-content-center
        #\place-content-start
        #\place-content-end
        #\place-content-between
        #\place-content-around
        #\place-content-evenly
        #\place-content-stretch

        ### BOX ALIGNMENT - Place Items
        #\place-items-auto
        #\place-items-start
        #\place-items-end
        #\place-items-center
        #\place-items-stretch

        ### BOX ALIGNMENT - Place Self
        #\place-self-auto
        #\place-self-start
        #\place-self-end
        #\place-self-center
        #\place-self-stretch

        ### SPACING - Padding
        #\p-0
        #\p-1
        #\p-2
        #\p-3
        #\p-4
        #\p-5
        #\p-6
        #\p-8
        #\p-10
        #\p-12
        #\p-16
        #\p-20
        #\p-24
        #\p-32
        #\p-40
        #\p-48
        #\p-56
        #\p-64
        #\p-px
        #\py-0
        #\px-0
        #\py-1
        #\px-1
        #\py-2
        #\px-2
        #\py-3
        #\px-3
        #\py-4
        #\px-4
        #\py-5
        #\px-5
        #\py-6
        #\px-6
        #\py-8
        #\px-8
        #\py-10
        #\px-10
        #\py-12
        #\px-12
        #\py-16
        #\px-16
        #\py-20
        #\px-20
        #\py-24
        #\px-24
        #\py-32
        #\px-32
        #\py-40
        #\px-40
        #\py-48
        #\px-48
        #\py-56
        #\px-56
        #\py-64
        #\px-64
        #\py-px
        #\px-px
        #\pt-0
        #\pr-0
        #\pb-0
        #\pl-0
        #\pt-1
        #\pr-1
        #\pb-1
        #\pl-1
        #\pt-2
        #\pr-2
        #\pb-2
        #\pl-2
        #\pt-3
        #\pr-3
        #\pb-3
        #\pl-3
        #\pt-4
        #\pr-4
        #\pb-4
        #\pl-4
        #\pt-5
        #\pr-5
        #\pb-5
        #\pl-5
        #\pt-6
        #\pr-6
        #\pb-6
        #\pl-6
        #\pt-8
        #\pr-8
        #\pb-8
        #\pl-8
        #\pt-10
        #\pr-10
        #\pb-10
        #\pl-10
        #\pt-12
        #\pr-12
        #\pb-12
        #\pl-12
        #\pt-16
        #\pr-16
        #\pb-16
        #\pl-16
        #\pt-20
        #\pr-20
        #\pb-20
        #\pt-24
        #\pr-24
        #\pb-24
        #\pl-24
        #\pt-32
        #\pr-32
        #\pb-32
        #\pl-32
        #\pt-40
        #\pr-40
        #\pb-40
        #\pl-40
        #\pt-48
        #\pr-48
        #\pb-48
        #\pl-48
        #\pt-56
        #\pr-56
        #\pb-56
        #\pl-56
        #\pt-64
        #\pr-64
        #\pb-64
        #\pl-64
        #\pt-px
        #\pr-px
        #\pb-px
        #\pl-px

        ### SPACING - Margin
        #\m-0
        #\m-1
        #\m-2
        #\m-3
        #\m-4
        #\m-5
        #\m-6
        #\m-8
        #\m-10
        #\m-12
        #\m-16
        #\m-20
        #\m-24
        #\m-32
        #\m-40
        #\m-48
        #\m-56
        #\m-64
        #\m-auto
        #\m-px
        #\-m-1
        #\-m-2
        #\-m-3
        #\-m-4
        #\-m-5
        #\-m-6
        #\-m-8
        #\-m-10
        #\-m-12
        #\-m-16
        #\-m-20
        #\-m-24
        #\-m-32
        #\-m-40
        #\-m-48
        #\-m-56
        #\-m-64
        #\my-0
        #\mx-0
        #\my-1
        #\mx-1
        #\my-2
        #\mx-2
        #\my-3
        #\mx-3
        #\my-4
        #\mx-4
        #\my-5
        #\mx-5
        #\my-6
        #\mx-6
        #\my-8
        #\mx-8
        #\my-10
        #\mx-10
        #\my-12
        #\mx-12
        #\my-16
        #\mx-16
        #\my-20
        #\mx-20
        #\my-24
        #\mx-24
        #\my-32
        #\mx-32
        #\my-40
        #\mx-40
        #\my-48
        #\mx-48
        #\my-56
        #\mx-56
        #\my-64
        #\mx-64
        #\my-auto
        #\mx-auto
        #\my-px
        #\mx-px
        #\-my-1
        #\-mx-1
        #\-my-2
        #\-mx-2
        #\-my-3
        #\-mx-3
        #\-my-4
        #\-mx-4
        #\-my-5
        #\-mx-5
        #\-my-6
        #\-mx-6
        #\-my-8
        #\-mx-8
        #\-my-10
        #\-mx-10
        #\-my-12
        #\-mx-12
        #\-my-16
        #\-mx-16
        #\-my-20
        #\-mx-20
        #\-my-24
        #\-mx-24
        #\-my-32
        #\-mx-32
        #\-my-40
        #\-mx-40
        #\-my-56
        #\-mx-56
        #\-my-64
        #\-mx-64
        #\-my-px
        #\-mx-px
        #\mt-0
        #\mr-0
        #\mb-0
        #\ml-0
        #\mt-1
        #\mr-1
        #\mb-1
        #\ml-1
        #\mt-2
        #\mr-2
        #\mb-2
        #\ml-2
        #\mt-3
        #\mr-3
        #\mb-3
        #\ml-3
        #\mt-4
        #\mr-4
        #\mb-4
        #\ml-4
        #\mt-5
        #\mr-5
        #\mb-5
        #\ml-5
        #\mt-6
        #\mr-6
        #\mb-6
        #\ml-6
        #\mt-8
        #\mr-8
        #\mb-8
        #\ml-8
        #\mt-10
        #\mr-10
        #\mb-10
        #\ml-10
        #\mt-12
        #\mr-12
        #\mb-12
        #\ml-12
        #\mt-16
        #\mr-16
        #\mb-16
        #\ml-16
        #\mt-20
        #\mr-20
        #\mb-20
        #\ml-20
        #\mt-24
        #\mr-24
        #\mb-24
        #\ml-24
        #\mt-32
        #\mr-32
        #\mb-32
        #\ml-32
        #\mt-40
        #\mr-40
        #\mb-40
        #\ml-40
        #\mt-48
        #\mr-48
        #\mb-48
        #\ml-48
        #\mt-56
        #\mr-56
        #\mb-56
        #\ml-56
        #\mt-64
        #\mr-64
        #\mb-64
        #\ml-64
        #\mt-auto
        #\mr-auto
        #\mb-auto
        #\ml-auto
        #\mt-px
        #\mr-px
        #\mb-px
        #\ml-px
        #\-mt-1
        #\-mr-1
        #\-mb-1
        #\-ml-1
        #\-mt-2
        #\-mr-2
        #\-mb-2
        #\-ml-2
        #\-mt-3
        #\-mr-3
        #\-mb-3
        #\-ml-3
        #\-mt-4
        #\-mr-4
        #\-mb-4
        #\-ml-4
        #\-mt-5
        #\-mr-5
        #\-mb-5
        #\-ml-5
        #\-mt-6
        #\-mr-6
        #\-mb-6
        #\-ml-6
        #\-mt-8
        #\-mr-8
        #\-mb-8
        #\-ml-8
        #\-mt-10
        #\-mr-10
        #\-mb-10
        #\-ml-10
        #\-mt-12
        #\-mr-12
        #\-mb-12
        #\-ml-12
        #\-mt-16
        #\-mr-16
        #\-mb-16
        #\-ml-16
        #\-mt-20
        #\-mr-20
        #\-mb-20
        #\-ml-20
        #\-mt-24
        #\-mr-24
        #\-mb-24
        #\-ml-24
        #\-mt-32
        #\-mr-32
        #\-mb-32
        #\-ml-32
        #\-mt-40
        #\-mr-40
        #\-mb-40
        #\-ml-40
        #\-mt-48
        #\-mr-48
        #\-mb-48
        #\-ml-48
        #\-mt-56
        #\-mr-56
        #\-mb-56
        #\-ml-56
        #\-mt-64
        #\-mr-64
        #\-mb-64
        #\-ml-64
        #\-mt-px
        #\-mr-px
        #\-mb-px
        #\-ml-px

        ### SPACING - Space Between
        #\space-y-0
        #\space-x-0
        #\space-y-1
        #\space-x-1
        #\space-y-2
        #\space-x-2
        #\space-y-3
        #\space-x-3
        #\space-y-4
        #\space-x-4
        #\space-y-5
        #\space-x-5
        #\space-y-6
        #\space-x-6
        #\space-y-8
        #\space-x-8
        #\space-y-10
        #\space-x-10
        #\space-y-12
        #\space-x-12
        #\space-y-16
        #\space-x-16
        #\space-y-20
        #\space-x-20
        #\space-y-24
        #\space-x-24
        #\space-y-32
        #\space-x-32
        #\space-y-40
        #\space-x-40
        #\space-y-48
        #\space-x-48
        #\space-y-56
        #\space-x-56
        #\space-y-64
        #\space-x-64
        #\space-y-px
        #\space-x-px
        #\-space-y-1
        #\-space-x-1
        #\-space-y-2
        #\-space-x-2
        #\-space-y-3
        #\-space-x-3
        #\-space-y-4
        #\-space-x-4
        #\-space-y-5
        #\-space-x-5
        #\-space-y-6
        #\-space-x-6
        #\-space-y-8
        #\-space-x-8
        #\-space-y-10
        #\-space-x-10
        #\-space-y-12
        #\-space-x-12
        #\-space-y-16
        #\-space-x-16
        #\-space-y-20
        #\-space-x-20
        #\-space-y-24
        #\-space-x-24
        #\-space-y-32
        #\-space-x-32
        #\-space-y-40
        #\-space-x-40
        #\-space-y-48
        #\-space-x-48
        #\-space-y-56
        #\-space-x-56
        #\-space-y-64
        #\-space-x-64
        #\-space-y-px
        #\-space-x-px
        #\space-y-reverse
        #\space-x-reverse

        ### SIZING - Width
        #\w-0
        #\w-1
        #\w-2
        #\w-3
        #\w-4
        #\w-5
        #\w-6
        #\w-8
        #\w-10
        #\w-12
        #\w-16
        #\w-20
        #\w-24
        #\w-32
        #\w-40
        #\w-48
        #\w-56
        #\w-64
        #\w-auto
        #\w-px
        #\w-1/2
        #\w-1/3
        #\w-2/3
        #\w-1/4
        #\w-2/4
        #\w-3/4
        #\w-1/5
        #\w-2/5
        #\w-3/5
        #\w-4/5
        #\w-1/6
        #\w-2/6
        #\w-3/6
        #\w-4/6
        #\w-5/6
        #\w-1/12
        #\w-2/12
        #\w-3/12
        #\w-4/12
        #\w-5/12
        #\w-6/12
        #\w-7/12
        #\w-8/12
        #\w-9/12
        #\w-10/12
        #\w-11/12
        #\w-full
        #\w-screen

        ### SIZING - Min-Width
        #\min-w-0
        #\min-w-full

        ### SIZING - Max-Width
        #\max-w-none
        #\max-w-xs
        #\max-w-sm
        #\max-w-md
        #\max-w-lg
        #\max-w-xl
        #\max-w-2xl
        #\max-w-3xl
        #\max-w-4xl
        #\max-w-5xl
        #\max-w-6xl
        #\max-w-full
        #\max-w-screen-sm
        #\max-w-screen-md
        #\max-w-screen-lg
        #\max-w-screen-xl

        ### SIZING - Height
        #\h-0
        #\h-1
        #\h-2
        #\h-3
        #\h-4
        #\h-5
        #\h-6
        #\h-8
        #\h-10
        #\h-12
        #\h-16
        #\h-20
        #\h-24
        #\h-32
        #\h-40
        #\h-48
        #\h-56
        #\h-64
        #\h-auto
        #\h-full
        #\h-screen

        ### SIZING - Min-Height
        #\min-h-0
        #\min-h-full
        #\min-h-screen

        ### SIZING - Max-Height
        #\max-h-full
        #\max-h-screen

        ### TYPOGRAPHY -- Font Family
        #\font-sans
        #\font-serif
        #\font-mono

        ### TYPOGRAPHY - Font Size
        #\text-xs
        #\text-sm
        #\text-base
        #\text-lg
        #\text-xl
        #\text-2xl
        #\text-3xl
        #\text-4xl
        #\text-5xl
        #\text-6xl

        ### TYPOGRAPHY -- Font Smoothing
        #\antialiased
        #\subpixel-antialiased

        ### TYPOGRAPHY -- Font Style
        #\italic
        #\not-italic

        ### TYPOGRAPHY -- Font Weight
        #\font-hairline
        #\font-thin
        #\font-light
        #\font-normal
        #\font-medium
        #\font-semibold
        #\font-bold
        #\font-extrabold
        #\font-black

        ### TYPOGRAPHY -- Font Vaiant Numeric
        #\normal-nums
        #\ordinal
        #\slashed-zero
        #\lining-nums
        #\oldstyle-nums
        #\proportional-nums
        #\tabular-nums
        #\diagonal-fractions
        #\stacked-fractions

        ### TYPOGRAPHY -- Letter Spacing
        #\tracking-tighter
        #\tracking-tight
        #\tracking-normal
        #\tracking-wide
        #\tracking-wider
        #\tracking-widest

        ### TYPOGRAPHY -- Line Height
        #\leading-3
        #\leading-4
        #\leading-5
        #\leading-6
        #\leading-7
        #\leading-8
        #\leading-9
        #\leading-10
        #\leading-none
        #\leading-tight
        #\leading-snug
        #\leading-normal
        #\leading-relaxed
        #\leading-loose

        ### TYPOGRAPHY -- Line Style Type
        #\list-none
        #\list-disc
        #\list-decimal

        ### TYPOGRAPHY -- Line Style Position
        #\list-inside
        #\list-outside

        ### TYPOGRAPHY -- Placeholder Color
        #\placeholder-transparent
        #\placeholder-current
        #\placeholder-black
        #\placeholder-white
        #\placeholder-gray-100
        #\placeholder-gray-200
        #\placeholder-gray-300
        #\placeholder-gray-400
        #\placeholder-gray-500
        #\placeholder-gray-600
        #\placeholder-gray-700
        #\placeholder-gray-800
        #\placeholder-gray-900
        #\placeholder-red-100
        #\placeholder-red-200
        #\placeholder-red-300
        #\placeholder-red-400
        #\placeholder-red-500
        #\placeholder-red-600
        #\placeholder-red-700
        #\placeholder-red-800
        #\placeholder-red-900
        #\placeholder-orange-100
        #\placeholder-orange-200
        #\placeholder-orange-300
        #\placeholder-orange-400
        #\placeholder-orange-500
        #\placeholder-orange-600
        #\placeholder-orange-700
        #\placeholder-orange-800
        #\placeholder-orange-900
        #\placeholder-yellow-100
        #\placeholder-yellow-200
        #\placeholder-yellow-300
        #\placeholder-yellow-400
        #\placeholder-yellow-500
        #\placeholder-yellow-600
        #\placeholder-yellow-700
        #\placeholder-yellow-800
        #\placeholder-yellow-900
        #\placeholder-green-100
        #\placeholder-green-200
        #\placeholder-green-300
        #\placeholder-green-400
        #\placeholder-green-500
        #\placeholder-green-600
        #\placeholder-green-700
        #\placeholder-green-800
        #\placeholder-green-900
        #\placeholder-teal-100
        #\placeholder-teal-200
        #\placeholder-teal-300
        #\placeholder-teal-400
        #\placeholder-teal-500
        #\placeholder-teal-600
        #\placeholder-teal-700
        #\placeholder-teal-800
        #\placeholder-teal-900
        #\placeholder-blue-100
        #\placeholder-blue-200
        #\placeholder-blue-300
        #\placeholder-blue-400
        #\placeholder-blue-500
        #\placeholder-blue-600
        #\placeholder-blue-700
        #\placeholder-blue-800
        #\placeholder-blue-900
        #\placeholder-indigo-100
        #\placeholder-indigo-200
        #\placeholder-indigo-300
        #\placeholder-indigo-400
        #\placeholder-indigo-500
        #\placeholder-indigo-600
        #\placeholder-indigo-700
        #\placeholder-indigo-800
        #\placeholder-indigo-900
        #\placeholder-purple-100
        #\placeholder-purple-200
        #\placeholder-purple-300
        #\placeholder-purple-400
        #\placeholder-purple-500
        #\placeholder-purple-600
        #\placeholder-purple-700
        #\placeholder-purple-800
        #\placeholder-purple-900
        #\placeholder-pink-100
        #\placeholder-pink-200
        #\placeholder-pink-300
        #\placeholder-pink-400
        #\placeholder-pink-500
        #\placeholder-pink-600
        #\placeholder-pink-700
        #\placeholder-pink-800
        #\placeholder-pink-900

        ### TYPOGRAPHY -- Placeholder Opacity
        #\placeholder-opacity-0
        #\placeholder-opacity-25
        #\placeholder-opacity-50
        #\placeholder-opacity-75
        #\placeholder-opacity-100

        ### TYPOGRAPHY - Text Align
        #\text-left
        #\text-center
        #\text-right
        #\text-justify

        ### TYPOGRAPHY - Text Color
        #\text-transparent
        #\text-current
        #\text-black
        #\text-white
        #\text-gray-100
        #\text-gray-200
        #\text-gray-300
        #\text-gray-400
        #\text-gray-500
        #\text-gray-600
        #\text-gray-700
        #\text-gray-800
        #\text-gray-900
        #\text-red-100
        #\text-red-200
        #\text-red-300
        #\text-red-400
        #\text-red-500
        #\text-red-600
        #\text-red-700
        #\text-red-800
        #\text-red-900
        #\text-orange-100
        #\text-orange-200
        #\text-orange-300
        #\text-orange-400
        #\text-orange-500
        #\text-orange-600
        #\text-orange-700
        #\text-orange-800
        #\text-orange-900
        #\text-yellow-100
        #\text-yellow-200
        #\text-yellow-300
        #\text-yellow-400
        #\text-yellow-500
        #\text-yellow-600
        #\text-yellow-700
        #\text-yellow-800
        #\text-yellow-900
        #\text-green-100
        #\text-green-200
        #\text-green-300
        #\text-green-400
        #\text-green-500
        #\text-green-600
        #\text-green-700
        #\text-green-800
        #\text-green-900
        #\text-teal-100
        #\text-teal-200
        #\text-teal-300
        #\text-teal-400
        #\text-teal-500
        #\text-teal-600
        #\text-teal-700
        #\text-teal-800
        #\text-teal-900
        #\text-blue-100
        #\text-blue-200
        #\text-blue-300
        #\text-blue-400
        #\text-blue-500
        #\text-blue-600
        #\text-blue-700
        #\text-blue-800
        #\text-blue-900
        #\text-indigo-100
        #\text-indigo-200
        #\text-indigo-300
        #\text-indigo-400
        #\text-indigo-500
        #\text-indigo-600
        #\text-indigo-700
        #\text-indigo-800
        #\text-indigo-900
        #\text-purple-100
        #\text-purple-200
        #\text-purple-300
        #\text-purple-400
        #\text-purple-500
        #\text-purple-600
        #\text-purple-700
        #\text-purple-800
        #\text-purple-900
        #\text-pink-100
        #\text-pink-200
        #\text-pink-300
        #\text-pink-400
        #\text-pink-500
        #\text-pink-600
        #\text-pink-700
        #\text-pink-800
        #\text-pink-900

        ### TYPOGRAPHY - Text Opacity
        #\text-opacity-0
        #\text-opacity-25
        #\text-opacity-50
        #\text-opacity-75
        #\text-opacity-100

        ### TYPOGRAPHY - Text Decoration
        #\underline
        #\line-through
        #\no-underline

        ### TYPOGRAPHY - Text Transform
        #\uppercase
        #\lowercase
        #\capitalize
        #\normal-case

        ### TYPOGRAPHY - Vertical Alige
        #\align-baseline
        #\align-top
        #\align-middle
        #\align-bottom
        #\align-text-top
        #\align-text-bottom

        ### TYPOGRAPHY - Whitespace
        #\whitespace-normal
        #\whitespace-no-wrap
        #\whitespace-pre
        #\whitespace-pre-line
        #\whitespace-pre-wrap

        ### TYPOGRAPHY - Word Break
        #\break-normal
        #\break-words
        #\break-all
        #\truncate

        ### BACKGROUNDS - Background Attachment
        #\bg-fixed
        #\bg-local
        #\bg-scroll

        ### BACKGROUNDS - Background Clip
        #\bg-clip-border
        #\bg-clip-padding
        #\bg-clip-content
        #\bg-clip-text

        ### BACKGROUNDS - Background Color
        #\bg-transparent
        #\bg-current
        #\bg-black
        #\bg-white
        #\bg-gray-100
        #\bg-gray-200
        #\bg-gray-300
        #\bg-gray-400
        #\bg-gray-500
        #\bg-gray-600
        #\bg-gray-700
        #\bg-gray-800
        #\bg-gray-900
        #\bg-red-100
        #\bg-red-200
        #\bg-red-300
        #\bg-red-400
        #\bg-red-500
        #\bg-red-600
        #\bg-red-700
        #\bg-red-800
        #\bg-red-900
        #\bg-orange-100
        #\bg-orange-200
        #\bg-orange-300
        #\bg-orange-400
        #\bg-orange-500
        #\bg-orange-600
        #\bg-orange-700
        #\bg-orange-800
        #\bg-orange-900
        #\bg-yelow-100
        #\bg-yelow-200
        #\bg-yelow-300
        #\bg-yelow-400
        #\bg-yelow-500
        #\bg-yelow-600
        #\bg-yelow-700
        #\bg-yelow-800
        #\bg-yelow-900
        #\bg-green-100
        #\bg-green-200
        #\bg-green-300
        #\bg-green-400
        #\bg-green-500
        #\bg-green-600
        #\bg-green-700
        #\bg-green-800
        #\bg-green-900
        #\bg-teal-100
        #\bg-teal-200
        #\bg-teal-300
        #\bg-teal-400
        #\bg-teal-500
        #\bg-teal-600
        #\bg-teal-700
        #\bg-teal-800
        #\bg-teal-900
        #\bg-blue-100
        #\bg-blue-200
        #\bg-blue-300
        #\bg-blue-400
        #\bg-blue-500
        #\bg-blue-600
        #\bg-blue-700
        #\bg-blue-800
        #\bg-blue-900
        #\bg-indigo-100
        #\bg-indigo-200
        #\bg-indigo-300
        #\bg-indigo-400
        #\bg-indigo-500
        #\bg-indigo-600
        #\bg-indigo-700
        #\bg-indigo-800
        #\bg-indigo-900
        #\bg-purple-100
        #\bg-purple-200
        #\bg-purple-300
        #\bg-purple-400
        #\bg-purple-500
        #\bg-purple-600
        #\bg-purple-700
        #\bg-purple-800
        #\bg-purple-900
        #\bg-pink-100
        #\bg-pink-200
        #\bg-pink-300
        #\bg-pink-400
        #\bg-pink-500
        #\bg-pink-600
        #\bg-pink-700
        #\bg-pink-800
        #\bg-pink-900

        ### BACKGROUNDS - Background Opacity
        #\bg-opacity-0
        #\bg-opacity-25
        #\bg-opacity-50
        #\bg-opacity-75
        #\bg-opacity-100

        ### BACKGROUNDS - Background Position
        #\bg-bottom
        #\bg-center
        #\bg-left
        #\bg-left-bottom
        #\bg-left-top
        #\bg-right
        #\bg-right-bottom
        #\bg-right-top
        #\bg-top

        ### BACKGROUNDS - Background Repeat
        #\bg-repeat
        #\bg-no-repeat
        #\bg-repeat-x
        #\bg-repeat-y
        #\bg-repeat-round
        #\bg-repeat-space

        ### BACKGROUNDS - Background Size
        #\bg-auto
        #\bg-cover
        #\bg-contain

        ### BACKGROUNDS - Background Image
        #\bg-none
        #\bg-gradient-to-t
        #\bg-gradient-to-tr
        #\bg-gradient-to-r
        #\bg-gradient-to-br
        #\bg-gradient-to-b
        #\bg-gradient-to-bl
        #\bg-gradient-to-l
        #\bg-gradient-to-tl

        ### BACKGROUNDS - Gradient Color Stops
        #\from-transparent
        #\from-current
        #\from-black
        #\from-white
        #\from-gray-100
        #\from-gray-200
        #\from-gray-300
        #\from-gray-400
        #\from-gray-500
        #\from-gray-600
        #\from-gray-700
        #\from-gray-800
        #\from-gray-900
        #\from-red-100
        #\from-red-200
        #\from-red-300
        #\from-red-400
        #\from-red-500
        #\from-red-600
        #\from-red-700
        #\from-red-800
        #\from-red-900
        #\from-orange-100
        #\from-orange-200
        #\from-orange-300
        #\from-orange-400
        #\from-orange-500
        #\from-orange-600
        #\from-orange-700
        #\from-orange-800
        #\from-orange-900
        #\from-yellow-100
        #\from-yellow-200
        #\from-yellow-300
        #\from-yellow-400
        #\from-yellow-500
        #\from-yellow-600
        #\from-yellow-700
        #\from-yellow-800
        #\from-yellow-900
        #\from-green-100
        #\from-green-200
        #\from-green-300
        #\from-green-400
        #\from-green-500
        #\from-green-600
        #\from-green-700
        #\from-green-800
        #\from-green-900
        #\from-teal-100
        #\from-teal-200
        #\from-teal-300
        #\from-teal-400
        #\from-teal-500
        #\from-teal-600
        #\from-teal-700
        #\from-teal-800
        #\from-teal-900
        #\from-blue-100
        #\from-blue-200
        #\from-blue-300
        #\from-blue-400
        #\from-blue-500
        #\from-blue-600
        #\from-blue-700
        #\from-blue-800
        #\from-blue-900
        #\from-indigo-100
        #\from-indigo-200
        #\from-indigo-300
        #\from-indigo-400
        #\from-indigo-500
        #\from-indigo-600
        #\from-indigo-700
        #\from-indigo-800
        #\from-indigo-900
        #\from-purple-100
        #\from-purple-200
        #\from-purple-300
        #\from-purple-400
        #\from-purple-500
        #\from-purple-600
        #\from-purple-700
        #\from-purple-800
        #\from-purple-900
        #\from-pink-100
        #\from-pink-200
        #\from-pink-300
        #\from-pink-400
        #\from-pink-500
        #\from-pink-600
        #\from-pink-700
        #\from-pink-800
        #\from-pink-900
        #\via-transparent
        #\via-current
        #\via-black
        #\via-white
        #\via-gray-100
        #\via-gray-200
        #\via-gray-300
        #\via-gray-400
        #\via-gray-500
        #\via-gray-600
        #\via-gray-700
        #\via-gray-800
        #\via-gray-900
        #\via-red-100
        #\via-red-200
        #\via-red-300
        #\via-red-400
        #\via-red-500
        #\via-red-600
        #\via-red-700
        #\via-red-800
        #\via-red-900
        #\via-orange-100
        #\via-orange-200
        #\via-orange-300
        #\via-orange-400
        #\via-orange-500
        #\via-orange-600
        #\via-orange-700
        #\via-orange-800
        #\via-orange-900
        #\via-yellow-100
        #\via-yellow-200
        #\via-yellow-300
        #\via-yellow-400
        #\via-yellow-500
        #\via-yellow-600
        #\via-yellow-700
        #\via-yellow-800
        #\via-yellow-900
        #\via-green-100
        #\via-green-200
        #\via-green-300
        #\via-green-400
        #\via-green-500
        #\via-green-600
        #\via-green-700
        #\via-green-800
        #\via-green-900
        #\via-teal-100
        #\via-teal-200
        #\via-teal-300
        #\via-teal-400
        #\via-teal-500
        #\via-teal-600
        #\via-teal-700
        #\via-teal-800
        #\via-teal-900
        #\via-blue-100
        #\via-blue-200
        #\via-blue-300
        #\via-blue-400
        #\via-blue-500
        #\via-blue-600
        #\via-blue-700
        #\via-blue-800
        #\via-blue-900
        #\via-indigo-100
        #\via-indigo-200
        #\via-indigo-300
        #\via-indigo-400
        #\via-indigo-500
        #\via-indigo-600
        #\via-indigo-700
        #\via-indigo-800
        #\via-indigo-900
        #\via-purple-100
        #\via-purple-200
        #\via-purple-300
        #\via-purple-400
        #\via-purple-500
        #\via-purple-600
        #\via-purple-700
        #\via-purple-800
        #\via-purple-900
        #\via-pink-100
        #\via-pink-200
        #\via-pink-300
        #\via-pink-400
        #\via-pink-500
        #\via-pink-600
        #\via-pink-700
        #\via-pink-800
        #\via-pink-900
        #\to-transparent
        #\to-current
        #\to-black
        #\to-white
        #\to-gray-100
        #\to-gray-200
        #\to-gray-300
        #\to-gray-400
        #\to-gray-500
        #\to-gray-600
        #\to-gray-700
        #\to-gray-800
        #\to-gray-900
        #\to-red-100
        #\to-red-200
        #\to-red-300
        #\to-red-400
        #\to-red-500
        #\to-red-600
        #\to-red-700
        #\to-red-800
        #\to-red-900
        #\to-orange-100
        #\to-orange-200
        #\to-orange-300
        #\to-orange-400
        #\to-orange-500
        #\to-orange-600
        #\to-orange-700
        #\to-orange-800
        #\to-orange-900
        #\to-yellow-100
        #\to-yellow-200
        #\to-yellow-300
        #\to-yellow-400
        #\to-yellow-500
        #\to-yellow-600
        #\to-yellow-700
        #\to-yellow-800
        #\to-yellow-900
        #\to-green-100
        #\to-green-200
        #\to-green-300
        #\to-green-400
        #\to-green-500
        #\to-green-600
        #\to-green-700
        #\to-green-800
        #\to-green-900
        #\to-teal-100
        #\to-teal-200
        #\to-teal-300
        #\to-teal-400
        #\to-teal-500
        #\to-teal-600
        #\to-teal-700
        #\to-teal-800
        #\to-teal-900
        #\to-blue-100
        #\to-blue-200
        #\to-blue-300
        #\to-blue-400
        #\to-blue-500
        #\to-blue-600
        #\to-blue-700
        #\to-blue-800
        #\to-blue-900
        #\to-indigo-100
        #\to-indigo-200
        #\to-indigo-300
        #\to-indigo-400
        #\to-indigo-500
        #\to-indigo-600
        #\to-indigo-700
        #\to-indigo-800
        #\to-indigo-900
        #\to-purple-100
        #\to-purple-200
        #\to-purple-300
        #\to-purple-400
        #\to-purple-500
        #\to-purple-600
        #\to-purple-700
        #\to-purple-800
        #\to-purple-900
        #\to-pink-100
        #\to-pink-200
        #\to-pink-300
        #\to-pink-400
        #\to-pink-500
        #\to-pink-600
        #\to-pink-700
        #\to-pink-800
        #\to-pink-900

        ### BORDERS - Border Radius
        #\rounded-none
        #\rounded-sm
        #\rounded
        #\rounded-md
        #\rounded-lg
        #\rounded-full
        #\rounded-t-none
        #\rounded-r-none
        #\rounded-b-none
        #\rounded-l-none
        #\rounded-t-sm
        #\rounded-r-sm
        #\rounded-b-sm
        #\rounded-l-sm
        #\rounded-t
        #\rounded-r
        #\rounded-b
        #\rounded-l
        #\rounded-t-md
        #\rounded-r-md
        #\rounded-b-md
        #\rounded-l-md
        #\rounded-t-lg
        #\rounded-r-lg
        #\rounded-b-lg
        #\rounded-l-lg
        #\rounded-t-full
        #\rounded-r-full
        #\rounded-b-full
        #\rounded-l-full
        #\rounded-tl-none
        #\rounded-tr-none
        #\rounded-br-none
        #\rounded-bl-none
        #\rounded-tl-sm
        #\rounded-tr-sm
        #\rounded-br-sm
        #\rounded-bl-sm
        #\rounded-tl
        #\rounded-tr
        #\rounded-br
        #\rounded-bl
        #\rounded-tl-md
        #\rounded-tr-md
        #\rounded-br-md
        #\rounded-bl-md
        #\rounded-tl-lg
        #\rounded-tr-lg
        #\rounded-br-lg
        #\rounded-bl-lg
        #\rounded-tl-full
        #\rounded-tr-full
        #\rounded-br-full
        #\rounded-bl-full

        ### BORDERS - Border Width
        #\border-0
        #\border-2
        #\border-4
        #\border-8
        #\border
        #\border-t-0
        #\border-r-0
        #\boredr-b-0
        #\border-l-0
        #\border-t-2
        #\border-r-2
        #\boredr-b-2
        #\border-l-2
        #\border-t-4
        #\border-r-4
        #\boredr-b-4
        #\border-l-4
        #\border-t-8
        #\border-r-8
        #\boredr-b-8
        #\border-l-8
        #\border-t
        #\border-r
        #\boredr-b
        #\border-l

        ### BORDERS - Border Color
        #\border-transparent
        #\border-current
        #\border-black
        #\border-white
        #\border-gray-100
        #\border-gray-200
        #\border-gray-300
        #\border-gray-400
        #\border-gray-500
        #\border-gray-600
        #\border-gray-700
        #\border-gray-800
        #\border-gray-900
        #\border-red-100
        #\border-red-200
        #\border-red-300
        #\border-red-400
        #\border-red-500
        #\border-red-600
        #\border-red-700
        #\border-red-800
        #\border-red-900
        #\border-orange-100
        #\border-orange-200
        #\border-orange-300
        #\border-orange-400
        #\border-orange-500
        #\border-orange-600
        #\border-orange-700
        #\border-orange-800
        #\border-orange-900
        #\border-yellow-100
        #\border-yellow-200
        #\border-yellow-300
        #\border-yellow-400
        #\border-yellow-500
        #\border-yellow-600
        #\border-yellow-700
        #\border-yellow-800
        #\border-yellow-900
        #\border-green-100
        #\border-green-200
        #\border-green-300
        #\border-green-400
        #\border-green-500
        #\border-green-600
        #\border-green-700
        #\border-green-800
        #\border-green-900
        #\border-teal-100
        #\border-teal-200
        #\border-teal-300
        #\border-teal-400
        #\border-teal-500
        #\border-teal-600
        #\border-teal-700
        #\border-teal-800
        #\border-teal-900
        #\border-blue-100
        #\border-blue-200
        #\border-blue-300
        #\border-blue-400
        #\border-blue-500
        #\border-blue-600
        #\border-blue-700
        #\border-blue-800
        #\border-blue-900
        #\border-indigo-100
        #\border-indigo-200
        #\border-indigo-300
        #\border-indigo-400
        #\border-indigo-500
        #\border-indigo-600
        #\border-indigo-700
        #\border-indigo-800
        #\border-indigo-900
        #\border-purple-100
        #\border-purple-200
        #\border-purple-300
        #\border-purple-400
        #\border-purple-500
        #\border-purple-600
        #\border-purple-700
        #\border-purple-800
        #\border-purple-900
        #\border-pink-100
        #\border-pink-200
        #\border-pink-300
        #\border-pink-400
        #\border-pink-500
        #\border-pink-600
        #\border-pink-700
        #\border-pink-800
        #\border-pink-900

        ### BORDERS - Border Opacity
        #\border-opacity-0
        #\border-opacity-25
        #\border-opacity-50
        #\border-opacity-75
        #\border-opacity-100

        ### BORDERS - Border Style
        #\border-solid
        #\border-dashed
        #\border-dotted
        #\border-dobule
        #\border-none

        ### BORDERS - Divide Width
        #\divide-y-0
        #\divide-x-0
        #\divide-y-2
        #\divide-x-2
        #\divide-y-4
        #\divide-x-4
        #\divide-y-8
        #\divide-x-8
        #\divide-y
        #\divide-x
        #\divide-y-reverse
        #\divide-x-reverse

        ### BORDERS - Divide Color
        #\divide-transparent
        #\divide-current
        #\divide-black
        #\divide-white
        #\divide-gray-100
        #\divide-gray-200
        #\divide-gray-300
        #\divide-gray-400
        #\divide-gray-500
        #\divide-gray-600
        #\divide-gray-700
        #\divide-gray-800
        #\divide-gray-900
        #\divide-red-100
        #\divide-red-200
        #\divide-red-300
        #\divide-red-400
        #\divide-red-500
        #\divide-red-600
        #\divide-red-700
        #\divide-red-800
        #\divide-red-900
        #\divide-orange-100
        #\divide-orange-200
        #\divide-orange-300
        #\divide-orange-400
        #\divide-orange-500
        #\divide-orange-600
        #\divide-orange-700
        #\divide-orange-800
        #\divide-orange-900
        #\divide-yellow-100
        #\divide-yellow-200
        #\divide-yellow-300
        #\divide-yellow-400
        #\divide-yellow-500
        #\divide-yellow-600
        #\divide-yellow-700
        #\divide-yellow-800
        #\divide-yellow-900
        #\divide-green-100
        #\divide-green-200
        #\divide-green-300
        #\divide-green-400
        #\divide-green-500
        #\divide-green-600
        #\divide-green-700
        #\divide-green-800
        #\divide-green-900
        #\divide-teal-100
        #\divide-teal-200
        #\divide-teal-300
        #\divide-teal-400
        #\divide-teal-500
        #\divide-teal-600
        #\divide-teal-700
        #\divide-teal-800
        #\divide-teal-900
        #\divide-blue-100
        #\divide-blue-200
        #\divide-blue-300
        #\divide-blue-400
        #\divide-blue-500
        #\divide-blue-600
        #\divide-blue-700
        #\divide-blue-800
        #\divide-blue-900
        #\divide-indigo-100
        #\divide-indigo-200
        #\divide-indigo-300
        #\divide-indigo-400
        #\divide-indigo-500
        #\divide-indigo-600
        #\divide-indigo-700
        #\divide-indigo-800
        #\divide-indigo-900
        #\divide-purple-100
        #\divide-purple-200
        #\divide-purple-300
        #\divide-purple-400
        #\divide-purple-500
        #\divide-purple-600
        #\divide-purple-700
        #\divide-purple-800
        #\divide-purple-900
        #\divide-pink-100
        #\divide-pink-200
        #\divide-pink-300
        #\divide-pink-400
        #\divide-pink-500
        #\divide-pink-600
        #\divide-pink-700
        #\divide-pink-800
        #\divide-pink-900

        ### BORDERS - Divide Opacity
        #\divide-opacity-0
        #\divide-opacity-25
        #\divide-opacity-50
        #\divide-opacity-75
        #\divide-opacity-100

        ### BORDERS - Divide Style
        #\divide-solid
        #\divide-dashed
        #\divide-dotted
        #\divide-double
        #\divide-none

        ### TABLES - Border Collapse
        #\border-collapse
        #\border-separate

        ### TABLES - Table Layout
        #\table-auto
        #\table-fixed

        ### EFFECTS - Box Shadow
        #\shadow-xs
        #\shadow-sm
        #\shadow
        #\shadow-md
        #\shadow-lg
        #\shadow-xl
        #\shadow-2xl
        #\shadow-inner
        #\shadow-outline
        #\shadow-none

        ### EFFECTS - Opacity
        #\opacity-0
        #\opacity-25
        #\opacity-50
        #\opacity-75
        #\opacity-100

        ### TRANSITIONS AND ANIMATION - Transition Property
        #\transition-none
        #\transition-all
        #\transition
        #\transition-colors
        #\transition-opacity
        #\transition-shadow
        #\transition-transform

        ### TRANSITIONS AND ANIMATION - Transition Duration
        #\duration-75
        #\duration-100
        #\duration-150
        #\duration-200
        #\duration-300
        #\duration-500
        #\duration-700
        #\duration-1000

        ### TRANSITIONS AND ANIMATION - Transition Timing Function
        #\ease-linear
        #\ease-in
        #\ease-out
        #\ease-in-out

        ### TRANSITIONS AND ANIMATION - Transition Delay
        #\delay-75
        #\delay-100
        #\delay-150
        #\delay-200
        #\delay-300
        #\delay-500
        #\delay-700
        #\delay-1000

        ### TRANSITIONS AND ANIMATION - Animation
        #\animate-none
        #\animate-spin
        #\animate-ping
        #\animate-pulse

        ### TRANSFORMS - Scale
        #\scale-0
        #\scale-50
        #\scale-75
        #\scale-90
        #\scale-95
        #\scale-100
        #\scale-105
        #\scale-110
        #\scale-125
        #\scale-150
        #\scale-x-0
        #\scale-x-50
        #\scale-x-75
        #\scale-x-90
        #\scale-x-95
        #\scale-x-100
        #\scale-x-105
        #\scale-x-110
        #\scale-x-125
        #\scale-x-150
        #\scale-y-0
        #\scale-y-50
        #\scale-y-75
        #\scale-y-90
        #\scale-y-95
        #\scale-y-100
        #\scale-y-105
        #\scale-y-110
        #\scale-y-125
        #\scale-y-150

        ### TRANSFORMS - Rotate
        #\rotate-0
        #\rotate-45
        #\rotate-90
        #\rotate-180
        #\-rotate-180
        #\-rotate-90
        #\-rotate-45

        ### TRANSFORMS - Translate
        #\translate-x-0
        #\translate-x-1
        #\translate-x-2
        #\translate-x-3
        #\translate-x-4
        #\translate-x-5
        #\translate-x-6
        #\translate-x-8
        #\translate-x-10
        #\translate-x-12
        #\translate-x-16
        #\translate-x-20
        #\translate-x-24
        #\translate-x-32
        #\translate-x-40
        #\translate-x-48
        #\translate-x-56
        #\translate-x-64
        #\translate-x-px
        #\-translate-x-0
        #\-translate-x-1
        #\-translate-x-2
        #\-translate-x-3
        #\-translate-x-4
        #\-translate-x-5
        #\-translate-x-6
        #\-translate-x-8
        #\-translate-x-10
        #\-translate-x-12
        #\-translate-x-16
        #\-translate-x-20
        #\-translate-x-24
        #\-translate-x-32
        #\-translate-x-40
        #\-translate-x-48
        #\-translate-x-56
        #\-translate-x-64
        #\-translate-x-px
        #\-translate-x-full
        #\-translate-x-1/2
        #\translate-x-1/2
        #\translate-x-full
        #\translate-y-1
        #\translate-y-2
        #\translate-y-3
        #\translate-y-4
        #\translate-y-5
        #\translate-y-6
        #\translate-y-8
        #\translate-y-10
        #\translate-y-12
        #\translate-y-16
        #\translate-y-20
        #\translate-y-24
        #\translate-y-32
        #\translate-y-40
        #\translate-y-48
        #\translate-y-56
        #\translate-y-64
        #\translate-y-px
        #\-translate-y-1
        #\-translate-y-2
        #\-translate-y-3
        #\-translate-y-4
        #\-translate-y-5
        #\-translate-y-6
        #\-translate-y-8
        #\-translate-y-10
        #\-translate-y-12
        #\-translate-y-16
        #\-translate-y-20
        #\-translate-y-24
        #\-translate-y-32
        #\-translate-y-40
        #\-translate-y-48
        #\-translate-y-56
        #\-translate-y-64
        #\-translate-y-px
        #\-translate-y-full
        #\-translate-y-1/2
        #\translate-y-1/2
        #\translate-y-full

        ### TRANSFORMS - Skew
        #\skew-x-0
        #\skew-x-3
        #\skew-x-6
        #\skew-x-12
        #\-skew-x-12
        #\-skew-x-6
        #\-skew-x-3
        #\skew-y-0
        #\skew-y-3
        #\skew-y-6
        #\skew-y-12
        #\-skew-y-12
        #\-skew-y-6
        #\-skew-y-3

        ### TRANSFORMS - Transform Origine
        #\origin-center
        #\origin-top
        #\origin-top-right
        #\origin-right
        #\origin-bottom-right
        #\origin-bottom
        #\origin-bottom-left
        #\origin-left
        #\origin-top-left

        ### INTERACTIVITY - Appearance
        #\appearance-none

        ### INTERACTIVITY - Cursor
        #\cursor-auto
        #\cursor-default
        #\cursor-pointer
        #\cursor-wait
        #\cursor-text
        #\cursor-move
        #\cursor-not-allowed

        ### INTERACTIVITY - Outline
        #\outline-none

        ### INTERACTIVITY - Pointer Events
        #\pointer-events-none
        #\pointer-events-auto

        ### INTERACTIVITY - Resize
        #\resize-none
        #\resize-y
        #\resize-x
        #\resize

        ### INTERACTIVITY - User Select
        #\select-none
        #\select-text
        #\select-all
        #\select-auto

        ### SVG - Fill
        #\fill-current

        ### SVG - Stroke
        #\stroke-current

        ### SVG - Stroke Width
        #\stroke-0
        #\stroke-1
        #\stroke-2

        ### ACCESSIBILITY - Screen Readers
        #\sr-only
        #\not-sr-noly
      ]
  }
  theme:
    extend: {}
  variants:
    accessibility: <[responsive focus]>
    align-content: <[responsive]>
    align-stems: <[responsive]>
    align-self: <[responsive]>
    appearance: <[responsive]>
    background-attachment: <[responsive]>
    background-clip: <[responsive]>
    background-color: <[responsive hover focus]>
    background-image: <[responsive]>
    gradient-color-stops: <[responsive hover focus]>
    background-opacity: <[responsive hover focus]>
    background-position: <[responsive]>
    background-repeat: <[responsive]>
    background-size: <[responsive]>
    border-collapse: <[responsive]>
    border-color: <[responsive hover focus]>
    border-opacity: <[responsive hover focus]>
    border-radius: <[responsive]>
    border-style: <[responsive]>
    border-width: <[responsive]>
    box-shadow: <[responsive hover focus]>
    box-sizing: <[responsive]>
    container: <[responsive]>
    cursor: <[responsive]>
    display: <[responsive]>
    divide-color: <[responsive]>
    divide-opacity: <[responsive]>
    divide-style: <[responsive]>
    divide-width: <[responsive]>
    fill: <[responsive]>
    flex: <[responsive]>
    flex-direction: <[responsive]>
    flex-grow: <[responsive]>
    flex-shrink: <[responsive]>
    flex-wrap: <[responsive]>
    float: <[responsive]>
    clear: <[responsive]>
    font-family: <[responsive]>
    font-size: <[responsive]>
    font-smoothing: <[responsive]>
    font-variant-numeric: <[responsive]>
    font-style: <[responsive]>
    font-weight: <[responsive hover focus]>
    height: <[responsive]>
    inset: <[responsive]>
    justify-content: <[responsive]>
    justify-items: <[responsive]>
    justify-self: <[responsive]>
    letter-spacing: <[responsive]>
    line-height: <[responsive]>
    list-style-position: <[responsive]>
    list-style-type: <[responsive]>
    margin: <[responsive]>
    max-height: <[responsive]>
    max-width: <[responsive]>
    min-height: <[responsive]>
    min-width: <[responsive]>
    object-fit: <[responsive]>
    object-position: <[responsive]>
    opacity: <[responsive hover focus]>
    order: <[responsive]>
    outline: <[responsive focus]>
    overflow: <[responsive]>
    overscroll-behavior: <[responsive]>
    padding: <[responsive]>
    place-content: <[responsive]>
    place-items: <[responsive]>
    place-self: <[responsive]>
    placeholder-color: <[responsive focus]>
    placeholder-opacity: <[responsive focus]>
    pointer-events: <[responsive]>
    position: <[responsive]>
    resize: <[responsive]>
    space: <[responsive]>
    stroke: <[responsive]>
    stroke-width: <[responsive]>
    table-layout: <[responsive]>
    text-align: <[responsive]>
    text-color: <[responsive hover focus]>
    text-opacity: <[responsive hover focus]>
    text-decoration: <[responsive hover focus]>
    text-transform: <[responsive]>
    user-select: <[responsive]>
    vertical-align: <[responsive]>
    visibility: <[responsive]>
    whitespace: <[responsive]>
    width: <[responsive]>
    word-break: <[responsive]>
    z-index: <[responsive]>
    gap: <[responsive]>
    grid-auto-flow: <[responsive]>
    grid-template-columns: <[responsive]>
    grid-column: <[responsive]>
    grid-column-start: <[responsive]>
    grid-column-end: <[responsive]>
    grid-template-rows: <[responsive]>
    grid-row: <[responsive]>
    grid-row-start: <[responsive]>
    grid-row-end: <[responsive]>
    transform: <[responsive]>
    transform-origin: <[responsive]>
    scale: <[responsive hover focus]>
    rotate: <[responsive hover focus]>
    translate: <[responsive hover focus]>
    skew: <[responsive hover focus]>
    transition-property: <[responsive]>
    transition-timing-function: <[responsive]>
    transition-duration: <[responsive]>
    transition-delay: <[responsive]>
    animation: <[responsive]>
  pulgins: []
