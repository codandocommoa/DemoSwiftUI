//
//  DSLoadingProgressView.swift
//  TestesSwiftUI
//
//  Created by Moacir Ezequiel Lamego on 21/09/23.
//


import SwiftUI
public struct DSLoadingProgressView: View {
    private var onLoad: (() -> Void)?
    private var title: String = ""
    private var secondMessage: String = ""
    private var animation: Animation?
    @State var timeElapsed = 0
    @State var startTime = Date()
    @State var timer: Timer?
    @State var progress: CGFloat = 0.0
    @State var label: String = ""
    @State var hidden: Bool = true
    @State var updatedLabel: Bool = false
    @ObservedObject var state: DSLoadingProgress
    public init(initialProgress: CGFloat,
                state: DSLoadingProgress,
                title: String,
                firstMessage: String,
                secondMessage: String,
                animation: Animation? = .linear,
                onLoad: (() -> Void)?) {
        self.state = state
        self.onLoad = onLoad
        self.title = title
        self.secondMessage = secondMessage
        self.progress = initialProgress
        self.label = firstMessage
        self.animation = animation
    }
    public var body: some View {
        VStack {
            Spacer()
            Text(title)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal).padding(.bottom, 8)
            Text(label)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.gray).opacity(0.25)
                    Rectangle()
                        .fill(.green)
                        .frame(width: min(geo.size.width, geo.size.width * progress))
                        .animation(animation)
                }.cornerRadius(45.0)
            }.frame(height: 12).padding().opacity(hidden ? 0 : 1)
        }.padding(.bottom, 48)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onViewDidLoad {
                start()
            }
    }
    func start() {
        startTime = Date()
        onLoad?()
        hidden = false
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
                if progress >= 1.0 {
                    self.progress = 1.0
                    timer.invalidate()
                }
                switch state.state {
                case .loading:
                    self.progress += 0.01
                case .loaded:
                    self.progress = 1.0
                    timer.invalidate()
                }
                timeElapsed = Int(-startTime.timeIntervalSinceNow)
                if !updatedLabel && timeElapsed > 4 {
                    self.label = secondMessage
                    self.updatedLabel = true
                }
            }
        }
    }
}
extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
struct DSLoadingProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DSLoadingProgressView(initialProgress: 0,
                              state: DSLoadingProgress(),
                              title: "testing",
                              firstMessage: "testing",
                              secondMessage: "testing",
                              onLoad: {})
    }
}
public class DSLoadingProgress: ObservableObject {
    public init() {
    }
    public var state: DSLoadingProgressState = .loading
}
public enum DSLoadingProgressState {
    case loading
    case loaded
}
