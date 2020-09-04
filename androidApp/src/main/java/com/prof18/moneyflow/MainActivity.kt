package com.prof18.moneyflow

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.ui.platform.setContent
import com.prof18.moneyflow.style.MoneyFlowTheme
import com.prof18.moneyflow.ui.home.HomeScreen
import data.MoneyRepositoryFake
import presentation.home.HomeModel
import presentation.home.HomePresenter
import presentation.home.HomeView

class MainActivity : AppCompatActivity(), HomeView {

    private val presenter by scoped { HomePresenter(MoneyRepositoryFake()) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        presenter.attachView(this)
        presenter.computeHomeData()

        setContent {
            MoneyFlowTheme {
                HomeScreen(presenter)
            }
        }
    }

    override fun onDestroy() {
        presenter.detachView()
        super.onDestroy()
    }

    override fun presentData(homeModel: HomeModel) {
        TODO("Not yet implemented")
    }
}
